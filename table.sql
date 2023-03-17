create table AccountApplication(
	
	ApplicationID long primary key  ,
    Title varchar(10),
	Applicantname varchar(20) not null,
    FatherName varchar(30),
    MobileNumber int(10) unique,
    EmailId varchar(50) unique,
    AdhaarNumber int(12) unique not null,
    DateOfBirth date not null,
    AddressLine varchar(100) not null,
    Landmark varchar(40),
    City varchar(20) not null,
    State varchar(20) not null,
    Pincode int(6) not null,
    OccupationType varchar(20) not null,
    SourceOfIncome varchar(20) not null,
    GrossAnnualIncome double not null,
    StatusOfApproval boolean
);

create table Transaction(
	TransactionId int primary key auto_increment,
    TransactionDate date,
    Accountfrom
);


