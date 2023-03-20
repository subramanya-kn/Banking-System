
use demo;


create table AccountApplication(
	ApplicantID int primary key auto_increment,
    ApplicantName varchar(30) not null,
    Fathername varchar(30) not null,
    Gender varchar(1) not null,
    MobileNumber int(10) not null unique,
    EmailID varchar(30) not null,
    AdhaarNumber int(12) not null unique,
    DateOFBirth date not null,
    
    AddressLine varchar(50) not null,
    Landmark varchar(20) not null,
    State varchar(20) not null,
    City varchar(20) not null,
    Pincode int not null,
    
    Occupationtype varchar(20) not null,
    SourceOfIncome varchar(30) not null,
    GrossIncome double not null,
    
    ApplicantStatus varchar(10) default 'Pending'
);



