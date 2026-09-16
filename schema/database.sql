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

insert into devices (
    device_id,
    ip_address,
    mac_address,
    owner_user_id,
    device_type
)values
    ('PC01','192.168.1.101','00:1A:2B:3C:4D:01',1,'Desktop'),
    ('LAP01','192.168.1.102','00:1A:2B:3C:4D:02',2,'Laptop'),
    ('LAP02','192.168.1.103','00:1A:2B:3C:4D:03',4,'Laptop'),
    ('PC02','192.168.1.104','00:1A:2B:3C:4D:04',5,'Desktop'),
    ('LAP03','192.168.1.105','00:1A:2B:3C:4D:05',7,'Laptop'),
    ('PRN01','192.168.1.110','00:1A:2B:3C:4D:06',3,'Printer'),
    ('PRN02','192.168.1.111','00:1A:2B:3C:4D:07',6,'Printer'),
    ('SRV01','192.168.1.120','00:1A:2B:3C:4D:08',8,'Server');

insert into applications (
    application_id,
    application_name,
    application_version
)values
    ('MSW01','Microsoft Word','2021'),
    ('MEX01','Microsoft Excel','2021'),
    ('MPT01','Microsoft PowerPoint','2021'),
    ('CHR01','Google Chrome','128.0'),
    ('OUT01','Microsoft Outlook','2021'),
    ('VSC01','Visual Studio Code','1.93'),
    ('TMS01','Microsoft Teams','2.0');

insert into tickets (
    ticket_id,
    user_id,
    technician_user_id,
    device_id,
    application_id,
    issue,
    status,
    priority
)values
    ('TKT01', 1, 2, 'PC01', 'MSW01', 'Microsoft Word is not opening', 'Resolved', 'High'),
    ('TKT02', 4, NULL, 'LAP02', 'CHR01', 'Google Chrome keeps crashing', 'Created', 'Medium'),
    ('TKT03', 5, 1, 'PC02', 'OUT01', 'Outlook is not syncing emails', 'In Progress', 'High'),
    ('TKT04', 6, 8, 'PRN02', 'MEX01', 'Excel files are not printing correctly', 'Resolved', 'Medium'),
    ('TKT05', 3, NULL, 'PRN01', 'MPT01', 'PowerPoint application is not responding', 'Created', 'High'),
    ('TKT06', 7, 2, 'LAP03', 'TMS01', 'Microsoft Teams is unable to connect', 'In Progress', 'Critical'),
    ('TKT07', 8, 1, 'SRV01', 'VSC01', 'Visual Studio Code is running slowly', 'Closed', 'Low'),
    ('TKT08', 9, NULL, 'LAP01', 'OUT01', 'Outlook password prompt appears repeatedly', 'Created', 'Medium'),
    ('TKT09', 10, 8, 'PC02', 'CHR01', 'Browser is unable to load internal pages', 'In Progress', 'High'),
    ('TKT10', 2, 7, 'LAP01', 'TMS01', 'Teams application is freezing during calls', 'Closed', 'Critical');

insert into ticket_comments (
    ticket_id,
    user_id,
    comment
)values
    ('TKT01', 1, 'Reported that Microsoft Word is not opening.'),
    ('TKT01', 2, 'Checked the application and repaired the Microsoft Office installation.'),
    ('TKT01', 2, 'Microsoft Word is opening normally after the repair.'),

    ('TKT02', 4, 'Google Chrome crashes whenever I open multiple tabs.'),

    ('TKT03', 5, 'Outlook is not syncing new emails.'),
    ('TKT03', 1, 'Checking the Outlook account configuration and sync settings.'),

    ('TKT04', 6, 'Excel files are printing with incorrect formatting.'),
    ('TKT04', 8, 'Updated the printer configuration and tested the Excel print settings.'),
    ('TKT04', 8, 'Printing is working correctly after the configuration change.'),

    ('TKT05', 3, 'PowerPoint stops responding when opening a presentation.'),

    ('TKT06', 7, 'Microsoft Teams is unable to connect to the service.'),
    ('TKT06', 2, 'Checking network connectivity and Teams connection settings.'),

    ('TKT07', 8, 'Visual Studio Code was running slowly during development.'),

    ('TKT08', 9, 'Outlook keeps asking for the password repeatedly.'),

    ('TKT09', 10, 'Browser cannot load internal company pages.'),
    ('TKT09', 8, 'Checking the network connection and internal DNS configuration.'),

    ('TKT10', 2, 'Microsoft Teams freezes during calls.'),
    ('TKT10', 7, 'Reviewed the system and Teams configuration. Issue has been resolved.');

insert into ticket_status_history (
    status_history_id,
    ticket_id,
    status,
    changed_by_user_id,
    status_changed_at
)values
     ('SH001', 'TKT01', 'Created', 1, '2026-09-10 09:15:00'),
    ('SH002', 'TKT01', 'In Progress', 2, '2026-09-10 10:00:00'),
    ('SH003', 'TKT01', 'Resolved', 2, '2026-09-10 12:30:00'),

    ('SH004', 'TKT02', 'Created', 4, '2026-09-11 09:20:00'),

    ('SH005', 'TKT03', 'Created', 5, '2026-09-11 10:15:00'),
    ('SH006', 'TKT03', 'In Progress', 1, '2026-09-11 11:00:00'),

    ('SH007', 'TKT04', 'Created', 6, '2026-09-12 09:30:00'),
    ('SH008', 'TKT04', 'In Progress', 8, '2026-09-12 10:15:00'),
    ('SH009', 'TKT04', 'Resolved', 8, '2026-09-12 13:00:00'),

    ('SH010', 'TKT05', 'Created', 3, '2026-09-12 11:45:00'),

    ('SH011', 'TKT06', 'Created', 7, '2026-09-13 08:30:00'),
    ('SH012', 'TKT06', 'In Progress', 2, '2026-09-13 09:15:00'),

    ('SH013', 'TKT07', 'Created', 8, '2026-09-13 10:00:00'),
    ('SH014', 'TKT07', 'In Progress', 1, '2026-09-13 10:45:00'),
    ('SH015', 'TKT07', 'Resolved', 1, '2026-09-13 14:00:00'),
    ('SH016', 'TKT07', 'Closed', 8, '2026-09-13 15:30:00'),

    ('SH017', 'TKT08', 'Created', 9, '2026-09-14 09:10:00'),

    ('SH018', 'TKT09', 'Created', 10, '2026-09-14 10:20:00'),
    ('SH019', 'TKT09', 'In Progress', 8, '2026-09-14 11:00:00'),

    ('SH020', 'TKT10', 'Created', 2, '2026-09-15 08:45:00'),
    ('SH021', 'TKT10', 'In Progress', 7, '2026-09-15 09:30:00'),
    ('SH022', 'TKT10', 'Resolved', 7, '2026-09-15 12:00:00'),
    ('SH023', 'TKT10', 'Closed', 7, '2026-09-15 13:00:00');