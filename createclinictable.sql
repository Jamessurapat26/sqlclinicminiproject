CREATE DATABASE Gerneral_Management_Clinic;

use Gerneral_Management_Clinic;

create table if not exists Patient(
	PT_ID VARCHAR(10) not null,
    PT_FirstName VARCHAR(255) not null,
    PT_LastName VARCHAR(255) not null,
    PT_BlooGroup VARCHAR(2) not null,
    PT_Phone VARCHAR(10) not null,
    House_Number VARCHAR(50) not null,
    District VARCHAR(255) not null,
    Sub_District VARCHAR(255) not null,
    Province VARCHAR(255) not null,
    Postal_Code VARCHAR(5) not null,
    PT_Disease VARCHAR(255) not null
);

alter table Patient 
add primary key (PT_ID);

create table if not exists Doctor(
	Doctor_ID varchar(10) not null,
    Doctor_FirstName varchar(255) not null,
    Doctor_LastName varchar(255) not null,
    Doctor_ProLiceNum varchar(100) not null,
    Doctor_Phone varchar(10) not null,
    primary key (Doctor_ID)
);

create table if not exists Treatment(
	Doctor_ID varchar(10) not null,
    PT_ID VARCHAR(10) not null,
    primary key (Doctor_ID, PT_ID),
	FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY (PT_ID) REFERENCES Patient(PT_ID)
);

ALTER TABLE Treatment
ADD Treat_dis VARCHAR(255) NOT NULL;

create table if not exists Appointment(
	Appointment_ID varchar(10) not null,
    Date_time Datetime not null,
    PT_ID VARCHAR(10) not null,
    Doctor_ID varchar(10) not null,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY (PT_ID) REFERENCES Patient(PT_ID)
);

Alter table Appointment
Add primary key(Appointment_ID);


create table if not exists Receipt(
	Receipt_ID varchar(10) not null,
    Receipt_Total int not null,
    Receipt_Date Date not null,
    primary key (Receipt_ID)
);

ALTER TABLE Receipt
ADD PT_ID VARCHAR(10) NOT NULL,
ADD FOREIGN KEY (PT_ID) REFERENCES Patient(PT_ID);


