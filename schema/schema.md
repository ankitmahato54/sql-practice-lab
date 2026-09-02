# IT Support Lab - Database Schema

## 1. departments

| Column          | Data Type | PK  | FK    | NULL     | UNIQUE | DEFAULT        | Notes                 |
| --------------- | --------- | --- | ----- | -------- | ------ | -------------- | --------------------- |
| department_id   | INTEGER   | YES | no FK | NOT NULL | YES    | auto-generated | department identifier |
| department_name | VARCHAR   | NO  | NO    | NOT NULL | YES    | -              | department name       |

## 2. users

| Column               | Data Type | PK  | FK  | NULL     | UNIQUE | DEFAULT        | Notes                          |
| -------------------- | --------- | --- | --- | -------- | ------ | -------------- | ------------------------------ |
| user_id              | INTEGER   | YES | NO  | NOT NULL | YES    | auto-generated | User identifier                |
| user_name            | VARCHAR   | NO  | NO  | NOT NULL | NO     | -              | user name                      |
| department_id        | INTEGER   | NO  | YES | NOT NULL | NO     | -              | FK = departments.department_id |
| user_date_of_joining | DATE      | NO  | NO  | NOT NULL | NO     | -              | date of joining                |
| user_designation     | VARCHAR   | NO  | NO  | NOT NULL | NO     | -              | user designation               |

## 3. technicians

| Column                    | Data Type | PK  | FK  | NULL     | UNIQUE | DEFAULT | Notes                  |
| ------------------------- | --------- | --- | --- | -------- | ------ | ------- | ---------------------- |
| user_id                   | INTEGER   | YES | YES | NOT NULL | YES    | -       | FK → users.user_id     |
| technician_specialization | VARCHAR   | NO  | NO  | NOT NULL | NO     | -       | primary specialization |
| support_level             | VARCHAR   | NO  | NO  | NOT NULL | NO     | -       | L1/L2/L3               |

## 4. devices

| Column        | Data Type | PK  | FK  | NULL     | UNIQUE | DEFAULT | Notes                                      |
| ------------- | --------- | --- | --- | -------- | ------ | ------- | ------------------------------------------ |
| device_id     | VARCHAR   | YES | NO  | NOT NULL | YES    | -       | Device identifier                          |
| ip_address    | INET      | NO  | NO  | NULL     | NO     | -       | IP address, may be unavailable initially   |
| mac_address   | VARCHAR   | NO  | NO  | NOT NULL | YES    | -       | MAC address must be unique                 |
| owner_user_id | INTEGER   | NO  | YES | NOT NULL | NO     | -       | FK → users.user_id                         |
| device_type   | VARCHAR   | NO  | NO  | NOT NULL | NO     | -       | Device type, e.g. Laptop, Desktop, Printer |

## 5. applications

| Column              | Data Type | PK  | FK  | NULL     | UNIQUE | DEFAULT | Notes                  |
| ------------------- | --------- | --- | --- | -------- | ------ | ------- | ---------------------- |
| application_id      | VARCHAR   | YES | NO  | NOT NULL | YES    | -       | Application identifier |
| application_name    | VARCHAR   | NO  | NO  | NOT NULL | YES    | -       | Application name       |
| application_version | VARCHAR   | NO  | NO  | NOT NULL | NO     | -       | Application version    |

## 6. tickets

| Column             | Data Type | PK  | FK  | NULL     | UNIQUE | DEFAULT | Notes                                                         |
| ------------------ | --------- | --- | --- | -------- | ------ | ------- | ------------------------------------------------------------- |
| ticket_id          | VARCHAR   | YES | NO  | NOT NULL | YES    | -       | Ticket identifier                                             |
| user_id            | INTEGER   | NO  | YES | NOT NULL | NO     | -       | FK → users.user_id; ticket creator                            |
| technician_user_id | INTEGER   | NO  | YES | NULL     | NO     | -       | FK → technicians.user_id; assigned technician                 |
| device_id          | VARCHAR   | NO  | YES | NOT NULL | NO     | -       | FK → devices.device_id                                        |
| application_id     | VARCHAR   | NO  | YES | NOT NULL | NO     | -       | FK → applications.application_id                              |
| issue              | TEXT      | NO  | NO  | NOT NULL | NO     | -       | Ticket issue/description                                      |
| status             | VARCHAR   | NO  | NO  | NOT NULL | NO     | Created | fixed allowed values - Created, In Progress, Resolved, Closed |
| priority           | VARCHAR   | NO  | NO  | NOT NULL | NO     | Low     | fixed allowed values - Low, Medium, High, Critical            |

## 7. ticket_comments

| Column            | Data Type | PK  | FK  | NULL     | UNIQUE | DEFAULT           | Notes                         |
| ----------------- | --------- | --- | --- | -------- | ------ | ----------------- | ----------------------------- |
| comment_id        | INTEGER   | YES | NO  | NOT NULL | YES    | auto-generated    | Comment identifier            |
| ticket_id         | VARCHAR   | NO  | YES | NOT NULL | NO     | -                 | FK → tickets.ticket_id        |
| user_id           | INTEGER   | NO  | YES | NOT NULL | NO     | -                 | FK → users.user_id            |
| comment           | TEXT      | NO  | NO  | NOT NULL | NO     | -                 | Comment content               |
| comment_date_time | TIMESTAMP | NO  | NO  | NOT NULL | NO     | CURRENT_TIMESTAMP | Time when comment was created |

## 8. ticket_status_history

| Column             | Data Type | PK  | FK  | NULL     | UNIQUE | DEFAULT           | Notes                                                 |
| ------------------ | --------- | --- | --- | -------- | ------ | ----------------- | ----------------------------------------------------- |
| status_history_id  | VARCHAR   | YES | NO  | NOT NULL | YES    | -                 | Status history identifier                             |
| ticket_id          | VARCHAR   | NO  | YES | NOT NULL | NO     | -                 | FK → tickets.ticket_id                                |
| status             | VARCHAR   | NO  | NO  | NOT NULL | NO     | -                 | fixed values - Created, In Progress, Resolved, Closed |
| changed_by_user_id | INTEGER   | NO  | YES | NOT NULL | NO     | -                 | FK → users.user_id                                    |
| status_changed_at  | TIMESTAMP | NO  | NO  | NOT NULL | NO     | CURRENT_TIMESTAMP | Time when status changed                              |
