select * from Bank_loan_data

select COUNT(id) as total_loan_application from Bank_loan_data

select COUNT(id) as MTD_Total_loan_application from Bank_loan_data
Where year(issue_date)= 2021 And month(issue_date) = 12

select sum(loan_amount) as PMTD_total_funded_amount from Bank_loan_data
where MONTH(issue_date) = 11 and year(issue_date) = 2021

select sum(total_payment)as MTD_total_amount_received from Bank_loan_data
where MONTH(issue_date)= 12 and YEAR(issue_date)=2021

select ROUND(avg(int_rate),4)*100 as MTD_avg_interest_rate from Bank_loan_data
where MONTH(issue_date)= 12 and YEAR(issue_date)= 2021

select ROUND(avg(dti),4)*100 as MTD_avg_dti from Bank_loan_data
where MONTH(issue_date)= 12 and YEAR(issue_date)= 2021

select 
	(count(case when loan_status = 'Fully paid' or loan_status = 'current' then id end)*100)
	/
	count(id) as good_loan_percentage
from Bank_loan_data

select COUNT(id) as good_loan_application from Bank_loan_data
where loan_status = 'Fully paid' or loan_status = 'Current'

select sum(loan_amount) as good_loan_funded_amount from Bank_loan_data
where loan_status= 'Fully paid' or loan_status = 'Current'


select 
	(count(case when loan_status = 'Charged off' then id end)*100)
	/
	count(id) as bad_loan_percentage
from Bank_loan_data

select sum(total_payment) as bad_loan_Amount_received from Bank_loan_data
where loan_status = 'Charged off'

select 
	loan_status,
	COUNT(id) as Total_loan_applications,
	SUM(total_payment) as Total_amount_received,
	SUM(Loan_amount) as Total_funded_amount,
	AVG(int_rate * 100) as Interest_rate,
	AVG(dti * 100) as DTI
From
	Bank_loan_data
Group by
	loan_status

Use [Bank loan DB]

select
	loan_status,
	SUM(total_payment) as MTD_total_amount_received,
	SUM(loan_amount) as MTD_total_Funded_amount
From bank_loan_data
where MONTH(issue_date) = 12
group by loan_status

select
	MONTH(issue_date) as Month_no,
	datename(month,Issue_date) as Month_name,
	count(id) as Total_loan_application,
	Sum(loan_amount) as total_funded_amount,
	sum(total_payment) as Total_received_amount
from bank_loan_data
group by MONTH(issue_date), DATENAME(month,issue_date)
order by MONTH(issue_date)

select  
	address_state,
	COUNT(id) as total_loan_applications,
	SUM(loan_amount) as total_funded_amount,
	SUM(total_payment) as total_received_amount
from bank_loan_data
group by address_state
order by count(id) desc

select  
	term,
	COUNT(id) as total_loan_applications,
	SUM(loan_amount) as total_funded_amount,
	SUM(total_payment) as total_received_amount
from bank_loan_data
group by term
order by term

select  
	emp_length,
	COUNT(id) as total_loan_applications,
	SUM(loan_amount) as total_funded_amount,
	SUM(total_payment) as total_received_amount
from bank_loan_data
group by emp_length
order by count(id) desc

select  
	purpose,
	COUNT(id) as total_loan_applications,
	SUM(loan_amount) as total_funded_amount,
	SUM(total_payment) as total_received_amount
from bank_loan_data
group by purpose
order by count(id) desc

select  
	home_ownership,
	COUNT(id) as total_loan_applications,
	SUM(loan_amount) as total_funded_amount,
	SUM(total_payment) as total_received_amount
from bank_loan_data
group by home_ownership
order by count(id) desc