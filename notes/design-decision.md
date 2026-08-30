# SQL Lab Project - IT Support Ticket Management

## Design Decisions

### 1. Why PostgreSQL?

There are a lot of options available out there, and it completely depends on what you choose. I chose PostgreSQL because of its rich features, like RDBMS capabilities, which make creating relationships easier due to the availability of many features. It is also open source, so I decided to use it in my case. As I have a keen interest in cloud learning, PostgreSQL will help me out there as well. It's completely your choice what you choose.

### 2. Why did you choose 8 tables?

You can use as many tables as you want. After writing my requirements and deciding what I wanted to demonstrate here in this project, I think these 8 tables will be enough.

### 3. Why does technicians use user_id instead of a separate technician_id?

A user can be anyone. It can be a user or a technician; both are users in their respective fields. In order to keep it simple, I have just used the user_id, which will be used for both users and technicians.

### 4. Why is technician_user_id in tickets nullable?

I made it nullable because when a ticket is generated at the initial stage, it is not assigned to any technician initially. So, to represent that scenario, I have made it nullable.

### 5. Why does ticket_comments have a separate comment_id?

The reason behind this is that every comment needs its own unique identifier. A particular ticket can have multiple comments, so to know exactly which comment is associated with what comment content, I have used a separate comment_id.

### 6. Why is ticket_status_history a separate table?

I knowingly made it a separate table to show the ticket history throughout a particular ticket's lifecycle. From the ticket creation to the ticket being closed, its status can get changed many times. It can be from Created to In Progress, then Resolved and Closed. It can also go back to In Progress if the issue is not resolved.

### 7. Why does changed_by_user_id reference users?

It references the user_id because it will show which user has changed the ticket status.

### 8. Why does status have fixed values?

Its values are fixed because I have selected only a specific set of values to show the ticket status, like Created, In Progress, Resolved, and Closed.

### 9. Why does priority have fixed values?

Same case here as we did with the status, but it has Low, Medium, High, and Critical. This represents most of the scenarios.

### 10. Normalization / avoiding unnecessary duplication

### 11. Why are certain relationships one-to-many?

It depends upon the scenario or what you want to do with your tables. In my case, I have selected certain relationships as one-to-many because this scenario fits best according to my project. You can choose what works best for your own project according to its needs.

Suppose we take an example here in this project between the department table and user table. One department contains many users, but the converse is not true. One user cannot belong to many departments, so one user is related to one department only, which establishes the relationship as 1:N, meaning one department can have many users.