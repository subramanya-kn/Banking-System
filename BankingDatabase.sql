
create database BankingApplicationDatabase;
use BankingApplicationDatabase;

create table AccountApplication(
	ApplicantID int primary key auto_increment,
    ApplicantName varchar(30) not null,
    Fathername varchar(30) not null,
    Gender varchar(1) not null,
    MobileNumber varchar(10) not null unique,
    EmailID varchar(30) not null,
    AdhaarNumber varchar(12) not null unique,
    DateOFBirth date not null,
    ApplicantStatus varchar(10) default 'Pending'
);

alter table accountapplication auto_increment = 1;

insert into AccountApplication(ApplicantName ,Fathername ,Gender ,MobileNumber,EmailID , AdhaarNumber,DateOFBirth, ApplicantStatus) 
values("Darshan","Shashidhar",'M',"8217696330","darshan@gmail.com","458296371250",'2001-06-16',"APPROVED");

insert into AccountApplication(ApplicantName ,Fathername ,Gender ,MobileNumber ,EmailID , AdhaarNumber,DateOFBirth, ApplicantStatus) 
values("Subramanya","Narayanaswamy",'M',"9325089630","Subramanya@gmail.com","125369870325",'2001-04-18',"PENDING");

insert into AccountApplication(ApplicantName ,Fathername ,Gender ,MobileNumber ,EmailID , AdhaarNumber,DateOFBirth, ApplicantStatus) 
values("Pavan","Venkatesh",'M',"9108816073","pavan@gmail.com","12365894369",'2002-01-08',"APPROVED");

insert into AccountApplication(ApplicantName ,Fathername ,Gender ,MobileNumber ,EmailID , AdhaarNumber,DateOFBirth, ApplicantStatus) 
values("Shriharsha","Shridhar",'M',"9483410801","shriharsha@gmail.com","125263218562",'2001-11-08',"APPROVED");

insert into AccountApplication(ApplicantName ,Fathername ,Gender ,MobileNumber ,EmailID , AdhaarNumber,DateOFBirth, ApplicantStatus) 
values("Ajaya_Krishna","Mahabaleshwara",'M',"9380586924","ajayakrishna@gmail.com","737179737130",'2001-08-27',"REJECTED");

create table ApplicantAddress(
	 AddressLine varchar(50) not null,
    Landmark varchar(20) not null,
    State varchar(20) not null,
    City varchar(20) not null,
    Pincode int not null,
    AppID int,
    foreign key(AppID) references AccountApplication(ApplicantID)
    
);

insert into ApplicantAddress values("Jaynagara","Pramukh","karnataka","bangalore",560001,1);
insert into ApplicantAddress values("JP Nagar","1522","karnataka","bangalore",560015,2);
insert into ApplicantAddress values("yediyur","Kantinivas","karnataka","bangalore",56000,3);
insert into ApplicantAddress values("Bogadhi","PeopleForAnimal","karnataka","Mysore",570007,4);
insert into ApplicantAddress values("Vidyaranyapuram","NIE","karnataka","Mysore",570008,5);

create table ApplicantOccupationType(
		Occupationtype varchar(20) not null,
		SourceOfIncome varchar(30) not null,
		GrossIncome double not null,
		ApplID int,
		foreign key(ApplID) references AccountApplication(ApplicantID)
);

insert into ApplicantOccupationType values("Businessman","Commission",750000,1);
insert into ApplicantOccupationType values("Engineer","Salary",750000,2);
insert into ApplicantOccupationType values("Doctor","Salary",2000000,3);
insert into ApplicantOccupationType values("AutoMobileEngineer","Salary",1500000,4);
insert into ApplicantOccupationType values("SoftwareEngineer","Salary",1000000,5);

create table Accountholder(
	AccountNumber int primary key auto_increment,
    AvailableBalance double default 5000 ,
    ApplicantID int,
    foreign key(ApplicantID) references accountapplication(ApplicantID)
    
);

alter table accountholder auto_increment = 10000;

insert into  Accountholder( AvailableBalance ,ApplicantID) values(5000,1);

insert into  Accountholder( AvailableBalance ,ApplicantID) values(5000,3);

insert into  Accountholder( AvailableBalance ,ApplicantID) values(5000,4);

create table beneficiaries(
	BeneficiaryID int auto_increment,
    BeneficiaryAccountNumber int ,
    BeneficiaryName varchar(30) not null,
    NickName varchar(10) not null,
    IFSCCode varchar(11) not null,
    BeneficiaryBankName varchar(20) not null,
    UserAccountNumber int not null,
    primary key(BeneficiaryID,BeneficiaryAccountNumber),
    foreign key(UserAccountNumber) references AccountHolder(AccountNumber)
);
alter table beneficiaries auto_increment = 1;

insert into beneficiaries( BeneficiaryAccountNumber,BeneficiaryName ,NickName ,IFSCCode ,BeneficiaryBankName ,UserAccountNumber)
values(10000,"Darshan","D","3DS001","3DSBank",10001); 

insert into beneficiaries( BeneficiaryAccountNumber,BeneficiaryName ,NickName ,IFSCCode ,BeneficiaryBankName ,UserAccountNumber)
values(10002,"Shriharsha","Shri","3DS001","3DSBank",10001); 

insert into beneficiaries( BeneficiaryAccountNumber,BeneficiaryName ,NickName ,IFSCCode ,BeneficiaryBankName ,UserAccountNumber)
values(12345,"Mukhil","M","ABCDE","SBank",10001); 

insert into beneficiaries( BeneficiaryAccountNumber,BeneficiaryName ,NickName ,IFSCCode ,BeneficiaryBankName ,UserAccountNumber)
values(10001,"Pavan","P","3DS001","3DSBank",10000); 

insert into beneficiaries( BeneficiaryAccountNumber,BeneficiaryName ,NickName ,IFSCCode ,BeneficiaryBankName ,UserAccountNumber)
values(99999,"Subramanya Bhat","Sb","SBIN001","SBI",10000); 

insert into beneficiaries( BeneficiaryAccountNumber,BeneficiaryName ,NickName ,IFSCCode ,BeneficiaryBankName ,UserAccountNumber)
values(10001,"Pavan","P","3DS001","3DSBank",10002);    

insert into beneficiaries( BeneficiaryAccountNumber,BeneficiaryName ,NickName ,IFSCCode ,BeneficiaryBankName ,UserAccountNumber)
values(10000,"Darshan","D","3DS001","3DSBank",10002);    




create table transactions(
	TransactionID int primary key auto_increment,
    TransactionDate date not null,
    Remarks varchar(100),
    AvailableBalance double not null,
    Amount double not null,
    RemainingBalance double not null,
    AccountFrom int,
    AccountTo int,
    BenID int,
    foreign key(AccountFrom) references Accountholder(AccountNumber),
    foreign key(BenID,AccountTo) references beneficiaries(BeneficiaryID,BeneficiaryAccountNumber)
    
);
alter table transactions auto_increment=10000;
insert into transactions(TransactionDate ,Remarks,AvailableBalance,Amount ,RemainingBalance,AccountFrom,AccountTo,BenID ) values("2023-01-01","Food",10000,500,9500,10001,10000,1);

insert into transactions(TransactionDate ,Remarks,AvailableBalance,Amount ,RemainingBalance,AccountFrom,AccountTo,BenID ) values("2023-01-05","Taxi",9500,1000,8500,10001,10002,2);

insert into transactions(TransactionDate ,Remarks,AvailableBalance,Amount ,RemainingBalance,AccountFrom,AccountTo,BenID ) values("2023-01-10","OnlineShopping",8500,4000,4500,10001,12345,3);

insert into transactions(TransactionDate ,Remarks,AvailableBalance,Amount ,RemainingBalance,AccountFrom,AccountTo,BenID ) values("2023-01-02","",15000,500,14500,10000,10001,4);

insert into transactions(TransactionDate ,Remarks,AvailableBalance,Amount ,RemainingBalance,AccountFrom,AccountTo,BenID ) values("2023-01-09","Food",14500,10000,4500,10000,99999,5);

insert into transactions(TransactionDate ,Remarks,AvailableBalance,Amount ,RemainingBalance,AccountFrom,AccountTo,BenID ) values("2023-01-10","Decorations",5500,500,5000,10002,10000,7);
