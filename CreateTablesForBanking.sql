
use demo2;

drop table applicantaddress;
drop table ApplicantOccupationType;
drop table transactions;
drop table beneficiaries;
drop table accountholder;
drop table accountapplication;

create table AccountApplication(
	ApplicantID int primary key auto_increment,
    ApplicantName varchar(30) not null,
    Fathername varchar(30) not null,
    Gender varchar(1) not null,
    MobileNumber int(10) not null unique,
    EmailID varchar(30) not null,
    AdhaarNumber int(12) not null unique,
    DateOFBirth date not null,
    ApplicantStatus varchar(10) default 'Pending'
);

alter table accountapplication auto_increment = 1;

create table Accountholder(
	AccountNumber int primary key auto_increment,
    AvailableBalance double default 5000 ,
    ApplicantID int,
    foreign key(ApplicantID) references accountapplication(ApplicantID)
    
);

alter table accountholder auto_increment = 10000000000;


create table beneficiaries(
    BeneficiaryAccountNumber int primary key,
    BeneficiaryName varchar(30) not null,
    NickName varchar(10) not null,
    IFSCCode varchar(11) not null,
    BeneficiaryBankName varchar(20) not null,
    UserAccountNumber int not null,
    foreign key(UserAccountNumber) references AccountHolder(AccountNumber)
);

create table transactions(
	TransactionID int primary key auto_increment,
    TransactionDate date not null,
    Remarks varchar(100),
    AvailableBalance double not null,
    TransferredAmount double not null,
    RemainingBalance double not null,
    AccountFrom int,
    AccountTo int,
    foreign key(AccountFrom) references Accountholder(AccountNumber),
    foreign key(AccountTo) references beneficiaries(BeneficiaryAccountNumber)
);

alter table transactions auto_increment=10000;
create table ApplicantAddress(
	 AddressLine varchar(50) not null,
    Landmark varchar(20) not null,
    State varchar(20) not null,
    City varchar(20) not null,
    Pincode int not null,
    AppID int,
    foreign key(AppID) references AccountApplication(ApplicantID)
    
);

create table ApplicantOccupationType(
		Occupationtype varchar(20) not null,
		SourceOfIncome varchar(30) not null,
		GrossIncome double not null,
		ApplID int,
		foreign key(ApplID) references AccountApplication(ApplicantID)
);