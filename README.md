# SQL Lab Project - IT Support Ticket Management

## What is the SQL Lab Project?

This project is about the actual implementation of the knowledge I gained while learning SQL and databases. The name of the project is **"SQL Lab Project - IT Support Ticket Management."** The reason behind choosing this topic, IT Support, is that I have already had exposure to working in an IT support role while I was at Wipro, so I decided to implement that ticket management system using SQL to showcase my understanding of databases, their relationships, and query processing.

Here, I have mainly taken 8 tables, but in a real-life IT ticket management system, there would be more than that. The idea here is just to replicate my knowledge and understanding of tables, their relationships, how to query using multiple tables, performing normalization, joins, aggregate functions, etc. I have used PostgreSQL in the project as it is open source and provides many useful features.

## What Database Am I Building?

I am building an IT Support Ticket Management System database. Here, I have shown how the ticket management system works behind the scenes and the ticket's entire lifecycle using various concepts. This database contains the details of users, technicians, departments, etc. I have also tried to show how tickets are assigned and how their status and progress are managed.

## What Database Tables I have Created

I have taken a total of 8 tables. Obviously, it can be more than that, but for simplicity, I have taken just 8 tables. I think that will be enough to showcase my skills here. The tables I have taken are:

### 1. departments 
- which consists of `department_id` (to uniquely identify the departments) and `department_name`.
### 2. users 
- it contains `user_id`, `user_name`, etc., to store user-related information in this table.
### 3. technicians 
- it contains the IT technicians details, such as their specialization and support level.
### 4. devices 
- this devices table tells you about the devices available and their owner details.
### 5. applications 
- this applications table will tell you about the application-related information for the tickets for which the user has raised a ticket.
### 6. tickets 
- this is one of the most important tables. As the name suggests, this table tells you the complete details of a ticket, such as its status and priority.
### 7. ticket_comments 
- this table tells you the complete details of the comments related to a particular ticket.

### 8. ticket_status_history 
- this table will tell you about the complete ticket history from creation to closure. This table contains the entire history of all tickets along with their status.

## What I Learned

I still remember when I was learning DBMS and its concepts. One of the things that excited me the most was how querying works with multiple tables. While learning, I got to know about joins and then normalization to reduce redundancy or make tables less redundant, which ultimately helps with better query processing.

I learned how to fetch data from a single or multiple tables, when to use subqueries, when to use aggregate functions, why we use normalization, and how to apply it to tables.

Maybe after this project, I will work on advanced topics like query optimization and many more.

## Technologies Used

I have used **"PostgreSQL"** throughout this project because of its open-source nature, rich features, and its usefulness for managing and demonstrating RDBMS concepts.

## How the Database is Structured

I have designed the ER diagram, which you can see in this project, where I have shown the relationships between the tables. Here, I have used Crow's Foot notation to show the relationships between the tables.

## Project Structure

- `schema/database.sql` - SQL implementation of the database schema
- `schema/schema.md` - Consolidated schema documentation for all 8 tables
- `er-diagram/er-diagram.png` - ER diagram showing the relationships between the tables
- `notes/design-decision.md` - Database design decisions and their reasoning

## Future Learning

After completing this project, I plan to explore advanced topics such as query optimization, database performance, indexing, and other advanced SQL and database concepts.