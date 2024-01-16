# Milestone 10: AKS Integration with Azure Key Vault for Secrets Management

## Task 1: Create an Azure Key Vault

Azure Key Vault is a cloud service for securely storing and accessing secrets. A secret is anything that you want to tightly control access to, such as API keys, passwords, or certificates. A vault is a logical group of secrets.

You can create a Key Vault by following these steps:

1. Sign in to the Azure portal.
2. From the Azure portal menu, or from the Home page, select `Create a resource`.
3. In the Search box, enter `Key Vault`.
4. From the results list, choose `Key Vault`.
5. On the Key Vault section, choose `Create`.
6. Provide the required information and select `Create`.
    
    ![Azure-KeyVault-Create.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-KeyVault-Create.png)

## Task 2: Assign Key Vault Administrator Role

The Key Vault Administrator role allows you to perform all data plane operations on a key vault and all objects in it, including certificates, keys, and secrets. However, it does not allow you to manage key vault resources or manage role assignments.

You can assign the Key Vault Administrator role to your Microsoft Entra ID user by following these steps:

1. Go to the Azure portal and sign in with your account.
2. From the left pane, select `Key Vaults` and then select the target key vault that you need.
3. After selecting the desired key vault, click on `Access control (IAM)`.
4. Click on `+Add` and then select `Add role assignment`.
5. In the `Role` field, search for the role named `Key Vault Administrator`.
6. Select your Microsoft Entra ID user in the `Assign access to` dropdown.
7. Then click on `Save`.

    ![Azure-KeyVault-AddRoleAssignment.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-KeyVault-AddRoleAssignment.png)

## Task 3: Create Secrets in Key Vault

You can create secrets in the Key Vault to secure the credentials used within the application to connect to the backend database. These secrets include the server name, server username, server password, and the database name. Ensure that the values of these secrets are set to the hardcoded values from the application code.

![Azure-KeyVault-Secret-ServerName.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-KeyVault-Secret-ServerName.png)

![Azure-KeyVault-Secret-ServerUsername.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-KeyVault-Secret-ServerUsername.png)

![Azure-KeyVault-Secret-ServerPassword.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-KeyVault-Secret-ServerPassword.png)!

![Azure-KeyVault-Secret-DatabaseName.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-KeyVault-Secret-DatabaseName.png)

![Azure-KeyVault-Secrets.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-KeyVault-Secrets.png)

## Task 4: Enable Managed Identity for AKS

Enable managed identity for the AKS cluster to allow it to authenticate and interact securely with the Key Vault. This can be done by running the following command in Azure CLI:

```bash
az aks update -g networking-resource-group -n terraform-aks-cluster --enable-managed-identity
```
NOTE: Make sure you use the names of your personal `resource group` and `terraform cluster`.

![Azure-Enable-Managed-Identity-for-AKS.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-Enable-Managed-Identity-for-AKS.png)

## Task 5: Assign Permissions to Managed Identity

Get the Managed Identity’s Principal ID: You need to get the Principal ID of the managed identity associated with your AKS cluster. You can do this by running the following command:

```bash
az aks show -g networking-resource-group -n terraform-aks-cluster --query identityProfile.kubeletidentity.objectId -o tsv
```

Assign the Key Vault Secrets Officer role to the managed identity associated with AKS, allowing it to retrieve and manage secrets. This can be done by running the following command in Azure CLI:

```bash
az role assignment create --role "Key Vault Secrets Officer" --assignee <Principal ID> --scope /subscriptions/{subscriptionid}/resourcegroups/{resource-group-name}/providers/Microsoft.KeyVault/vaults/{key-vault-name}
```

Replace `<Principal ID>` with the Principal ID you got from the previous step. Also, replace `{subscriptionid}`, `{resource-group-name}`, and `{key-vault-name}` with your subscription ID, resource group name, and key vault name respectively.

## Task 6: Update the Application Code

Integrate the Azure Identity and Azure Key Vault libraries into the Python application code to facilitate communication with Azure Key Vault. Modify the code to use managed identity credentials, ensuring secure retrieval of database connection details from the Key Vault.

Additionally, update the requirements file for the application's Docker image to include the newly required libraries. This step ensures that the Docker image includes all the necessary dependencies for seamless functioning of the updated code.

```python
# Update the requirements.txt file
flask==2.2.2
pyodbc==4.0.39
SQLAlchemy==2.0.21
werkzeug===2.2.3
azure-identity==1.7.0
azure-keyvault-secrets==4.3.0

# Update the application code
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient

credential = DefaultAzureCredential()
client = SecretClient(vault_url="https://<your-key-vault-name>.vault.azure.net", credential=credential)

server = client.get_secret("server").value
database = client.get_secret("database").value
username = client.get_secret("username").value
password = client.get_secret("password").value
driver= '{ODBC Driver 18 for SQL Server}'

# Create the connection string
connection_string=f'Driver={driver};\
    Server=tcp:{server},1433;\
    Database={database};\
    Uid={username};\
    Pwd={password};\
    Encrypt=yes;\
    TrustServerCertificate=no;\
    Connection Timeout=30;'
```

## Task 7: End-to-End Testing in AKS

Begin by conducting a thorough testing of the modified application locally, ensuring seamless integration with Azure Key Vault. Verify that the application can securely retrieve and utilize the database connections details from Key Vault using managed identity credentials.

I created a separate `Python` program called `test-access-to-azure-key-vault.py` to print out the secrets so that I could verify the new code from Task 6 was working.  The content of this Python file is:

```python
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient


# database connection 
credential = DefaultAzureCredential()
client = SecretClient(vault_url="https://webappdevops-keyvault.vault.azure.net/", credential=credential)

server = client.get_secret("server").value
database = client.get_secret("database").value
username = client.get_secret("username").value
password = client.get_secret("password").value


# Test access to Azure Key Vault
print("Server Name: ", server)
print("Database Name: ", database)
print("Server Username: ", username)
print("Server Password: ", password)
```

Proceed to deploy the modified application to the AKS cluster using the pre-established Azure DevOps CI/CD pipeline. Conduct end-to-end testing within the AKS environment to validate the functionality of the application, ensuring secure access to Key Vault secrets directly from the Azure DevOps CI/CD pipeline.

```bash
# Test the application locally
python app.py

# Deploy the application to AKS
git commit -am "Update application code and requirements.txt"
git push origin main

# Test the application in AKS
kubectl get pods
kubectl port-forward <pod-name> 5000:5000
curl localhost:5000
```

![Azure-DevOps-Pipelines-Run.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/Azure-DevOps-Pipelines-Run.png)

![DevOps Pipeline Architecture.png](https://github.com/a-maruf/Web-App-DevOps-Project/blob/main/Images/DevOps%20Pipeline%20Architecture.png)