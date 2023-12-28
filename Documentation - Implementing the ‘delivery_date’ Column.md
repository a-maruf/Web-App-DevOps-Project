# Documentation: Implementing the 'delivery_date' Column in the Web App DevOps Project

This documentation provides a comprehensive guide on how to implement a new feature - the `delivery_date` column - in the Web App DevOps Project. Web App DevOps Project application allows you to efficiently manage and track orders for a potential business. This documentation is intended for both developers who may need to maintain or modify the feature in the future, and end-users who will benefit from this new functionality.

## Table of Contents
1. Cloning the Repository
2. Creating an Issue for the New Column
3. Creating a Feature Branch
4. Making Code Changes
5. Pushing Changes to the Remote Branch
6. Creating and Merging a Pull Request

## Cloning the Repository
Use the `git clone` command to clone the forked repository onto your local machine. This allows you to work on the repository from your local machine.

```bash
git clone https://github.com/<your-username>/Web-App-DevOps-Project.git
```

## Creating an Issue for the New Column
Create an issue on the forked GitHub repository to track the development of the `delivery_date` column feature. This is crucial for effective communication within a development team.

1. Navigate to the forked repository at `https://github.com/<your-username>/Web-App-DevOps-Project`.
2. Click the `Issues` tab.
3. Click `New Issue`.
4. Provide a descriptive title and details about the new column addition.
5. Submit the issue.

## Creating a Feature Branch
Create a new branch called `feature/add-delivery-date`. This branch isolates the code changes required to include the `delivery_date` column.

```bash
git checkout -b feature/add-delivery-date
```

## Making Code Changes
Modify the code to incorporate the `delivery_date` column. Update both the `app.py` and `order.html` files in the repository.

### app.py
In the `Order` class, add the `delivery_date` column:

```python
class Order(Base):
    # ... other columns ...
    delivery_date = Column('Delivery Date', DateTime)  # Add this line
```

In the `add_order` route, update the form to include the `delivery_date` field and the `new_order` variable:

```python
@app.route('/add_order', methods=['POST'])
def add_order():
    # ... other form inputs ...
    delivery_date = request.form['delivery_date']  # Add this line

    # Create a new order object using the form data
    new_order = Order(
        # ... other attributes ...
        delivery_date=delivery_date  # Add this line
    )
```

### order.html
In the `order.html` template, update the table header and rows to include the `delivery_date` column:

```html
<tr>
    <!-- ... other headers ... -->
    <th>Delivery Date</th>  <!-- Add this line -->
</tr>
{% for order in orders %}
    <tr>
        <!-- ... other data ... -->
        <td>{{ order.delivery_date }}</td>  <!-- Add this line -->
    </tr>
{% endfor %}
```

In the form for adding a new order, add a new input field for `delivery_date`:

```html
<form method="post" action="/add_order">
    <!-- ... other form inputs ... -->
    <label for="delivery_date">Delivery Date:</label> <!-- Add this line -->
    <input type="date" id="delivery_date" name="delivery_date"><br><br>  <!-- Add this line -->
    <input type="submit" value="Add Order">
</form>
```

## Pushing Changes to the Remote Branch
After making the necessary code changes, push the changes to the remote repository:

```bash
git add .
git commit -m "Add delivery_date column"
git push origin feature/add-delivery-date
```

## Creating and Merging a Pull Request
Submit a pull request to merge the code changes from the feature branch into the main branch. Review the changes and merge the pull request.

This concludes the documentation for implementing the `delivery_date` column in the Web App DevOps Project. For any further queries or clarifications, feel free to reach out. Happy coding! 😊
