# Project assignmnet 4

### Members:
* Natalia Espínola Parra
* Katherine Jara Carrasco

### Implemented features
For this part of the project, we implemented interactivity in the web application, advancing the development of forms to enter and register on the website (with Devise), forms validation. CRUD operations. Mailbox functionality Enhanced designs and templates with Bootstrap libraries. We use CanCanCan to manage role permissions in the app.

In our views, you can see the content of the web application resources, where it is only possible to read the content.


**System Access:** You can enter with your email and password. You can enter with google (before you should have registered). You can log out.

**Registration:** You can register indicating your first name, last name, username, location, short bio, email, password and accepting the terms of use and services. You can change the password indicating the original, you can also recover it via email.

**User Administration:** You can create a new user, delete a user. 

**System Administration:** You can Create Users, Organizations and Comments of event. You can READ Event, Users, Organizations and Comments of event. You can Update Event, Users, Organizations and Comments of event. 

**User Profile:** You can view the user profile, edit the user profile, edit user fields (name, bio, location), view events to which the user has been invited, view created events. And vote for the event date. You can also cancel your account. You can see the profiles of other users by searching by username in search, you cannot access the profile, just see it.

**Organization:** You can see the organization page, manage the organization page by the administrator (delete it, add members), see public events. See: files, photos, videos.

**Mailbox:** You can see your inbox, view incoming messages and create new messages.

**Events:** You can view events, see title, description, location and creation date, add comments, see comments, invite guests, see: files, photos, videos.
** Acceptable Use Policy (AUP) and Terms of Service (ToS): ** Both documents in the footer, in order to register you must accept these terms. You can report abusive content: events.

**Search:** You can search user (name or username), organization, event by substring in title / description, event by creator, search event by organization.


### Features pending
We lacked to perfect the operation and design of some views, such as the calendar of an organization.

For events: Start event date vote, configure event date vote.

The delete operation (comments, events, organizations).

System Administration
(a) Perform CRUD operations on Users.
(b) Perform CRUD operations on Organizations.
(c) Perform CRUD operations on Events.
(d) Perform CRUD operations on Event comments.

User Administration
(a) New user.
(b) View user details.
i. Last access. ii. User role.
(c) Edit User.
(d) Delete user.

We used Factory Bot and FFaker to create data automatically, but we were never able to prove that this actually worked, because it threw us the error "NoMethodError: undefined method` create_list 'for main: Object "when we used the rake db: populate_fake_data command. But you can see the file test/factories.rb and lib/tasks/model_queries.rake that contains what we did about this.`


### Commands to test the app
* yarn install
* bundle install
* rake db:migrate
* rails c
* Rails.application.load_seed
