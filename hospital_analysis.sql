use hospital;

select * from hospital_management_data
limit 5;

#total number of patients admitted per department?

select Department,count(*) as no_of_patients
from hospital_management_data
group by Department
order by count(*) desc;

#Top 5 Most Common Diseases

SELECT 
    Diagnosis,
    COUNT(*) AS total_cases
FROM hospital_management_data
GROUP BY Diagnosis
ORDER BY total_cases DESC
LIMIT 5;

#Age Group with Highest Visits

SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 18 THEN '0-18'
        WHEN Age BETWEEN 19 AND 35 THEN '19-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '65+'
    END AS age_group,
    COUNT(*) AS total_patients
FROM hospital_management_data
GROUP BY age_group
ORDER BY total_patients DESC;


#Gender Comparison Across Departments

SELECT 
    Department,
    Gender,
    COUNT(*) AS patient_count
FROM hospital_management_data
GROUP BY Department, Gender
ORDER BY Department, Gender;

#Department with Highest Revenue

SELECT 
    Department,
    SUM(TotalBillAmount) AS total_revenue
FROM hospital_management_data
GROUP BY Department
ORDER BY total_revenue DESC
LIMIT 1;

#Top 3 Doctors by Patient Count

SELECT 
    DoctorName,
    COUNT(*) AS total_patients
FROM hospital_management_data
GROUP BY DoctorName
ORDER BY total_patients DESC
LIMIT 3;
