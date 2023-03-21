
use BankingApplicationDatabase;
select * from AccountApplication;
select * from applicantaddress;
select * from AccountApplication a join applicantaddress b on a.ApplicantID =b.AppID;
select * from  ApplicantOccupationType ;

select * from AccountApplication a join applicantaddress b on a.ApplicantID =b.AppID join ApplicantOccupationtype c on a.ApplicantID =c.ApplID order by ApplicantID;

select * from AccountApplication a join applicantaddress b on a.ApplicantID =b.AppID join ApplicantOccupationtype c on a.ApplicantID =c.ApplID where a.Applicantstatus="REJECTED";

select * from AccountApplication a join applicantaddress b on a.ApplicantID =b.AppID join ApplicantOccupationtype c on a.ApplicantID =c.ApplID join accountholder d on a.ApplicantID =d.ApplicantID;

delete from beneficiaries where BeneficiaryAccountNumber=10000 ;
delete from beneficiaries where (BeneficiaryID, BeneficiaryAccountNumber) in ((1, 10000), (2, 10000));

select * from beneficiaries;
select *from   Accountholder a join  beneficiaries b on a.AccountNumber = b.UserAccountNumber;

select * from Accountholder a join Transactions b on (a.AccountNumber=b.AccountFrom or a.AccountNumber=b.AccountTo) where a.AccountNumber=10000 order by b.TransactionDate; 
select * from transactions;