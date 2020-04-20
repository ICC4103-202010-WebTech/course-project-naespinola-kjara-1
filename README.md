# Project assignmnet 1.2

Members:
* Katherine Jara Carrasco
* Natalia Espínola Parra


## Requirements

- Numbers [1-10]: rake db:queries_demo

	(location lib/tasks/model_queries.rake) 
- Number 11: Users should have a unique username and email address.(Implemented, location app/models/user.rb) 
- Number 12: E-mail addresses should be well-formed. (Implemented, location app/models/user.rb) 
- Number 13: Explain what should happen model-wise if an event is deleted and guests have already cast
             votes. Explain how your model layer is well-behaved in this scenario.

If an event is deleted, then your guests will be removed from the Guest table. Votes relayed 
by the guests will be removed from the Votes table. Also, the dates available to vote for that 
event will be removed from the DatesToVotes table.

- Number 14: Explain what should happen model-wise if an organization is deleted and events have been
             already created within the organization. Explain how your model layer is well-behaved in this
             scenario.

If an organization is removed, the events that belong to that organization change to the creator 
user, and this user no longer belongs to the organization.

- Number 15: Explain what should happen model-wise if a user is deleted and the user has already created
             organizations, events and/or comments. Explain how your model layer is well-behaved in this
             scenario.

We assume that each user can belong to a single organization, so a user could only create one 
organization to have the position of organization administrator. An organization administrator 
has the power to grant the administration position to another user who is a member of the 
organization. Each organization has a single administrator. If the organization administrator 
is removed, then the system administrator can choose who will be the next administrator, otherwise 
the user with more invitations created for the organization that is not on the blacklist will be 
chosen by default.