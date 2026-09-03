create table departments (
   department_id   integer generated always as identity primary key,
   department_name varchar not null unique
);

create table users (
    user_id integer generated always as identity primary key,
    user_name varchar not null,
    department_id integer references departments(department_id) not null,
    user_date_of_joining date not null,
    user_designation varchar not null
);

create table technicians (
    user_id integer primary key references users(user_id) , technician_specialization varchar not null , 
    support_level varchar not null 
);

create table devices (
    device_id varchar primary key,
    ip_address inet,
    mac_address varchar not null unique,
    owner_user_id integer not null references users(user_id),
    device_type varchar not null
);

create table applications (
    application_id varchar primary key , 
    application_name varchar not null unique, 
    application_version varchar not null
);

create table tickets (
    ticket_id varchar primary key,
    user_id integer references users(user_id) not null,
    technician_user_id integer references technicians(user_id),
    device_id varchar references devices(device_id) not null,
    application_id varchar references applications(application_id) not null,
    issue text not null,
    status varchar not null default 'Created',
    priority varchar not null default 'Low'
);

create table ticket_comments (
    comment_id integer primary key generated always as identity,
    ticket_id varchar references tickets(ticket_id) not null,
    user_id integer references users(user_id) not null,
    comment text not null,
    comment_date_time timestamp not null default current_timestamp
);

create table ticket_status_history ( 
    status_history_id varchar primary key , 
    ticket_id varchar references tickets(ticket_id) not null, 
    status varchar not null, 
    changed_by_user_id integer references users(user_id) not null, status_changed_at timestamp not null default current_timestamp 
);



insert into departments (department_name)
values 
    ('IT Support'), 
    ('Network Operations'), 
    ('Finance'), 
    ('HR'),
    ('Sales');

insert into users (
    user_name,
    department_id,
    user_date_of_joining,
    user_designation
)
values
    ('Ankit Mahato', 1, '2021-06-14', 'IT Support Analyst'),
    ('Adarsh Rana', 2, '2020-03-09', 'Network engineer'),
    ('Subham Moharana', 3, '2022-01-17', 'Finance Analyst'),
    ('Rounak Karmakar', 1, '2023-08-21', 'IT Support Analyst'),
    ('Sumit Rai', 5, '2020-07-13', 'Sales Executive'),
    ('Suman Giri', 4, '2020-07-13', 'HR Executive'),
    ('Vikash Singh', 1, '2019-04-22', 'Senior IT Support Analyst'),
    ('Sonu Yadav', 2, '2022-09-05', 'Network Engineer'),
    ('Debanjan Gupta', 3, '2023-02-13', 'Finance Executive'),
    ('Nitish Kumar', 5, '2024-01-08', 'Sales Executive');

insert into technicians (
    user_id,
    technician_specialization,
    support_level
)values
    (1, 'Desktop Support', 'L1'),
    (2, 'Network Support', 'L2'),
    (7, 'System Administration', 'L3'),
    (8 , 'Network Support', 'L1');