select *
from financial_loan;

set sql_safe_updates =0;

UPDATE financial_loan
SET issue_date = STR_TO_DATE(issue_date, '%d-%m-%Y');

update financial_loan
set last_credit_pull_date = STR_TO_DATE(last_credit_pull_date, '%d-%m-%Y'),
	last_payment_date = STR_TO_DATE(last_payment_date, '%d-%m-%Y'),
	next_payment_date = STR_TO_DATE(next_payment_date, '%d-%m-%Y');
    
set sql_safe_updates =1;

-- 1. Total Loan Applications
select count(*) AS Total_Applications
from financial_loan;

--  MTD Loan Applications
select count(*) AS Total_Applications
from financial_loan
where month(issue_date) =12;    
--  PMTD Loan Application
select count(*) AS Total_Applications
from financial_loan
where month(issue_date)=11;

-- 2. Total Funded Amount
select sum(loan_amount) AS Total_Funded_Amount
from financial_loan;

--  MTD Total Funded Amount
select sum(loan_amount) AS Total_Funded_Amount
from financial_loan
where month(issue_date)=12;
--  PMTD Total Funded Amount
select sum(loan_amount) AS Total_Funded_Amount
from financial_loan
where month(issue_date)=11;

-- 3. Total Amount Received
select sum(total_payment) AS Total_Amount_Collected
from financial_loan;

-- MTD Total FAmount Received
select sum(total_payment) AS Total_Amount_Collected
from financial_loan
where month(issue_date)=12;
-- PMTD Total FAmount Received
select sum(total_payment) AS Total_Amount_Collected
from financial_loan
where month(issue_date)=11;

-- 4. Average Intrest Rate
select avg(int_rate)*100 AS Avg_Int_Rate
from financial_loan;

-- MTD Average Intrest Rate
select avg(int_rate)*100 AS Avg_Int_Rate
from financial_loan
where month(issue_date)=12;
-- PMTD Average Intrest Rate
select avg(int_rate)*100 AS Avg_Int_Rate
from financial_loan
where month(issue_date)=11;

-- 5. Average Debt-to-Income Ratio (DTI)
 select avg(dti)*100 AS Avg_DTI
from financial_loan;

-- MTD Average Intrest Rate
select avg(dti)*100 AS Avg_DTI
from financial_loan
where month(issue_date)=12;
-- PMTD Average Intrest Rate
select avg(dti)*100 AS Avg_DTI
from financial_loan
where month(issue_date)=11;

-- 6. Good Loan
-- Good Loan Percentage
select count(case when loan_status = 'Fully Paid' or loan_status = 'current' then id end)*100/COUNT(ID) as Good_Loan_percentage
from financial_loan;

-- Good Loan Application
select count(id) AS Good_Loan_Applications
from financial_loan
where loan_status = 'Fully Paid' or loan_status = 'current';

-- Good Loan Funded Amount
select sum(loan_amount) AS Good_Loan_Funded_amount 
from financial_loan
where loan_status = 'Fully Paid' or loan_status = 'current';

-- Good Loan Amount Received
select sum(total_payment) AS Good_Loan_amount_received
from financial_loan
where loan_status = 'Fully Paid' or loan_status = 'current';

-- 7. Bad Loan
-- Bad Loan Percentage
select count(case when loan_status = 'Charged Off' then id end)*100/COUNT(ID) as Good_Loan_percentage
from financial_loan;

-- Bad Loan Application
select count(id) AS Bad_Loan_Applications
from financial_loan
where loan_status = 'Charged Off';

-- Bad Loan Funded Amount
select sum(loan_amount) AS Bad_Loan_Funded_amount 
from financial_loan
where loan_status = 'Charged Off';

-- Bad Loan Amount Received
select sum(total_payment) AS Bad_Loan_amount_received
from financial_loan
where loan_status = 'Charged Off';


select loan_status,
count(id) as LoanCount,
sum(total_payment) as Total_Funded_Amount,
sum(loan_amount) as Total_Funded_Amount,
avg(int_rate)*100 as Interest_Rate,
avg(dti)*100 as DTI
from financial_loan
group by loan_status;

select loan_status,
sum(total_payment) as MTD_Total_Amount_Received,
sum(loan_amount) as MTD_Total_Funded_Amount
from financial_loan
where month(issue_date)=12
group by loan_status;

-- Bank Loan Report
select
month(issue_date) as Month_Number,
monthname(issue_date) as Month_Name,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received
from financial_loan
group by month(issue_date),monthname(issue_date)
order by Month_Number;

-- State
select
address_state as State,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received
from financial_loan
group by State
order by State;

-- Term
select
term as Term,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received
from financial_loan
group by Term
order by Term;

-- Employee Length
select
emp_length as Employee_Length,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received
from financial_loan
group by emp_length
order by emp_length;

-- Purpose
select
purpose as Purpose,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received
from financial_loan
group by purpose
order by purpose;

-- Home Ownership
select
home_ownership as Home_Ownership,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received
from financial_loan
group by home_ownership
order by home_ownership;