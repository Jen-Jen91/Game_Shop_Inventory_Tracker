# Video Game Shop

For this solo project, I designed a web app for video game shop owners who wish to keep track of their stock and save/edit other useful information. The code was written in Ruby with a PostgreSQL database, as well as HTML and CSS for the front-end design.

### To run the app:

* In the terminal, run the following commands to create the database and run the Ruby code:
    1) *createdb game_shop*
    2) *psql -d game_shop -f db/game_shop.sql*
    3) *ruby db/seeds.rb*
    4) *ruby app.rb* (keep this running whilst using the app)
* To view the app on the browser, head to http://localhost:4567/




### The brief for the project:
#### Shop Inventory

Build an app which allows a shopkeeper to track their shop's inventory. This is not an app which the customer will see, it is an admin/management app for the shop workers.

#### MVP

* The inventory should track individual products including name, description, stock quantity, buying cost, and selling price.
* The inventory should track manufacturers, including a name and any other appropriate details.
* The shop can sell anything you like but you should be able to create, edit and delete manufacturers/products separately.
* Show an inventory page, listing all the details for all the products in stock in a single view.
* As well as showing stock quantity as a number, the app should visually highlight "low stock" and "out of stock" items to the user.

#### Possible Extensions

* Calculate the markup on items in the store, and display it in the inventory
* Filter the inventory list by manufacturer. For example, provide an option to view all books in stock by a certain author.
* Categorise your items. Provide an option to filter the inventory list by these categories.

