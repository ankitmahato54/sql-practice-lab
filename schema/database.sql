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