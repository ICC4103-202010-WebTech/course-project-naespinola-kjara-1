# Project assignmnet 2

### Members:
* Natalia Espínola Parra
* Katherine Jara Carrasco

### Implemented features
For this part of the project, we implemented the design of our web application using the Bootstrap gem, with which you can navigate through all the sections of the site. We didn't rely on our original wireframe because we didn't get a good evaluation on it.

For routes we use shallow route nesting to define nested resources. We link the relevant sections and implement a home page, we create your PagesController with the home action that renders the home page. The root path points to pages#home.

In our views you can see the content of the resources of the web application, where it is only possible to read the content.
We implement strictly RESTful APIs to perform CRUD operations on event and comment resources, where comments is nested to events. We create a collection of requests in postman with tests of our API operations, which can be found in the "Postman Collection" section. We create an API namespace for our routes with their specific api controllers. In order for this to work we had to add the code indicated in the statement in config/initializers/inflections.rb

### Features pending
We lacked to perfect the operation and design of some views, such as the calendar of an organization, the members of an organization and that it is possible to see the name of the users in the messages. The bug at the footer: its static,will be improved soon. 

### Postman Collection
https://www.getpostman.com/collections/eed94b7bd1cc50099a0a


