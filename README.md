# Food Selling App

## **Description:**

\- Local businesses don’t have the money to build their own application, they usually go around this by having customers call them for orders. But that may interrupt whatever they’re doing at the time. So our app should allow any restaurant business to upload their menu under their restaurant name, whether or not they’re able to deliver (if not, the app will be able to notify a user when the food is ready for pickup). Customers will be able to search for a restaurant by name or city, order their food and pay for it through credit card/paypal. If they make an account, they can favorite a restaurant, save their credit info and their personal name.

## **User Stories:**

**Customer**

-   User sees an app icon in home screen with a styled launch screen
    
-   User is prompted to login into their account (business/customer) or continue as guest.
    
-   User will see a search bar which will give them the option to search either by location of business or business name
    
-   User can select a restaurant from the search results.
    
-   Each business will have a profile with details about its location, contact information, and menu.
    
-   User can select items from the businesses menu and how they want to receive their order.
    
-   User will be asked to enter credit card information once their order is completed.
    
-   User will be notified of their request if the transaction is successful and will see a message and the business.
    
-   User will be notified when order is ready via notification in the app.
    


----------


**Business**

-   User sees an app icon in home screen with a styled launch screen
    
-   User is prompted to login into their account (business/customer) or continue as guest.
    
-   When choosing business account, the following is prompted:
    
	-   Name of business
	    
	-   Address of business
	    
	-   Hours and days open
	    
	-   (optional) picture to represent the restaurant
	    

-   After creating an account, user can add menu items:
    
	-   Name of item
	    
	-   (optional) picture of item
	    
	-   Price of item
	    
	-   Delivery or not
	    
	-   (optional) which days/hours item is available (in case of a daily soup or similar)
    
-   User can also edit menu items if necessary

----------


## Wire Frames

**Customer**

![Main Screen](https://i.imgur.com/NM2oW17.png)

![Initial Screen before Signup](https://i.imgur.com/g2XL3l2.png)

![Signup Screen](https://i.imgur.com/IjRBTN2.png)

![Login Screen](https://i.imgur.com/ePxuX7A.png)


----------

## Feautures

- Required:
	
	- Splash page with App logo.
	- MenuViewController with option to login or signup or continue as a guest.
	- SearchViewController which user can perform a search for a business or by location.
	- ProfileBusinessViewController allows businesses to edit/add information and edit/create a menu.
	- ProfileCustomerViewController allows users to edit/add personal information and edit/add billing information.
	- CheckoutViewController allows users to perform a checkout operation by selecting a menu item from a businesses menu and 		choosing delivery method.


- Optionals:
	- Businesses can add a map view to their profile for easy location access.
	
	

----------


## Model Classes
	- Customer:
		- name,
		- address,
		- card_info
	
	- Business:
		- name,
		- location,
		- menu
		
	- Menu:
		- menuItems
		
	- MenuItem:
		- item_name,
		- description,
		- price
		
		
---------


**Considerations*

- What is your product pitch?
Most businesses have customers call to put down orders, but this could make things difficult for employees that cannot do everything at the same time. Our solution should allow any restaurant business to upload their menu under their restaurant name, and provide convenience for both the business and customer to put down orders.
Who are the key stakeholders for this app?
Businesses, customers, and normal curious users. They will be using this app to search for business/restaurants, look at the menus, and put down orders that they can either pick up or get delivered (if delivery is available).

- What are the core flows?
Key functions will be browsing businesses/restaurants and putting down an order for pick up.Screens that each user will see is the main launch screen, a screen where a business or customer can login. Unregistered users will be still be able to continue as guests to browse and view menus.


- What will your final demo look like?
On our final demo, a brand new user will first see the launch screen which will then lead to the screen that prompts them to login if they have an account. If the user does not have an account, they can still continue using the app to browse and view businesses, restaurants, and their menus. Both guests and registered customers will be able to make an order, pick an available date/time to pick up the order, and will receive a notification when the food is ready for pickup.

- What mobile features do you leverage?
The restaurant/business will have an address featured on their page, and we plan to provide an external link that allows the user to use any map application for directions to the address of the business/restaurant. The second feature is notifications. We want to notify the user when their food is ready for pick up.
What are your technical concerns?
One of the technical concerns we have is the database. We may face issues with having the application and server function well together.

	
	
	


	
