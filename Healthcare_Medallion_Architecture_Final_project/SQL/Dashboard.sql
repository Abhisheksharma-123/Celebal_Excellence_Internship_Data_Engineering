-- KPI 1 : Total Revenue


SELECT
ROUND(SUM(amount),2) AS total_revenue
FROM db_healthcare.healthcare_gold.patient_360;
-- KPI 2 : Total Patients


SELECT
COUNT(DISTINCT patient_id) AS total_patients
FROM db_healthcare.healthcare_gold.patient_360;

-- KPI 3 : Total Doctors

SELECT
COUNT(DISTINCT doctor_name) AS total_doctors
FROM db_healthcare.healthcare_gold.patient_360;

-- KPI 4 : Total Appointments


SELECT
COUNT(DISTINCT appointment_id) AS total_appointments
FROM db_healthcare.healthcare_gold.patient_360;

-- KPI 5 : Patient No Show Rate

SELECT
kpi,
value,
target
FROM db_healthcare.healthcare_gold.kpi_summary
WHERE kpi='Patient No Show Rate';

-- KPI 6 : Billing Accuracy

SELECT
kpi,
value,
target
FROM db_healthcare.healthcare_gold.kpi_summary
WHERE kpi='Billing Accuracy';

-- KPI 7 : Revenue Per Patient

SELECT *
FROM db_healthcare.healthcare_gold.revenue_per_patient;

-- KPI 8 : Revenue Per Doctor

SELECT *
FROM db_healthcare.healthcare_gold.revenue_per_doctor;

-- KPI 9 : Operating Cost Per Patient

SELECT *
FROM db_healthcare.healthcare_gold.operating_cost_per_patient;

-- Monthly Revenue Trend
SELECT
year,
month,
total_revenue,
average_bill,
total_bills
FROM db_healthcare.healthcare_gold.monthly_revenue
ORDER BY year,month;

-- Revenue by Hospital Branch

SELECT
hospital_branch,
total_revenue,
patients,
doctors,
appointments,
treatments
FROM db_healthcare.healthcare_gold.revenue_by_branch
ORDER BY total_revenue DESC;

-- Revenue by Doctor

SELECT
doctor_name,
specialization,
hospital_branch,
total_revenue,
average_bill,
total_patients,
total_appointments,
doctor_rank
FROM db_healthcare.healthcare_gold.revenue_by_doctor
ORDER BY total_revenue DESC;

-- Top 10 Doctors

SELECT *
FROM db_healthcare.healthcare_gold.top_doctors
ORDER BY doctor_rank;

-- Top 10 Patients

SELECT *
FROM db_healthcare.healthcare_gold.top_patients
ORDER BY patient_rank;

-- Appointment Summary

SELECT *
FROM db_healthcare.healthcare_gold.appointment_summary;

-- Payment Analysis=

SELECT *
FROM db_healthcare.healthcare_gold.payment_analysis;

-- Treatment Analysis

SELECT *
FROM db_healthcare.healthcare_gold.treatment_analysis;

-- Doctor Performance

SELECT *
FROM db_healthcare.healthcare_gold.doctor_performance
ORDER BY revenue DESC;

-- Branch Performance

SELECT *
FROM db_healthcare.healthcare_gold.branch_performance
ORDER BY total_revenue DESC;

-- Patient 360

SELECT *
FROM db_healthcare.healthcare_gold.patient_360;

-- Analytics Dataset

SELECT *
FROM db_healthcare.healthcare_gold.analytics_dataset;

-- KPI Summary

SELECT *
FROM db_healthcare.healthcare_gold.kpi_summary;

-- Executive Dashboard
SELECT *
FROM db_healthcare.healthcare_gold.executive_dashboard;

-- Revenue by Payment Method

SELECT
payment_method,
SUM(amount) AS total_revenue
FROM db_healthcare.healthcare_gold.patient_360
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- Appointment Status Distribution

SELECT
status,
COUNT(*) AS total_appointments
FROM db_healthcare.healthcare_gold.patient_360
GROUP BY status
ORDER BY total_appointments DESC;

-- Treatment Category Analysis

SELECT
treatment_type,
COUNT(*) AS total_treatments,
AVG(cost) AS average_cost,
SUM(cost) AS total_cost
FROM db_healthcare.healthcare_gold.patient_360
GROUP BY treatment_type
ORDER BY total_cost DESC;

-- Doctor Specialization Revenue
SELECT
specialization,
SUM(amount) AS total_revenue,
COUNT(DISTINCT doctor_name) AS doctors
FROM db_healthcare.healthcare_gold.patient_360
GROUP BY specialization
ORDER BY total_revenue DESC;

-- Branch-wise Patient Count

SELECT
hospital_branch,
COUNT(DISTINCT patient_id) AS total_patients
FROM db_healthcare.healthcare_gold.patient_360
GROUP BY hospital_branch
ORDER BY total_patients DESC;