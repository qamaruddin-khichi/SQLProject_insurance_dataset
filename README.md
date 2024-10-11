# Insurance Dataset SQL Project

## Table of Contents
- [About the Project](#about-the-project)
- [Purpose of the Project](#purpose-of-the-project)
- [Column Description](#column-description)
- [SQL Queries](#sql-queries)
  - [Beginner Level](#beginner-level-questions)
  - [Intermediate Level](#intermediate-level-questions)
  - [Advanced Level](#advanced-level-questions)
  - [CampusX Questions](#campusx-questions)
- [SQL Code](#sql-code)
- [Conclusion](#conclusion)

---

## About the Project

This project explores an insurance dataset containing demographic and health-related data, including age, gender, BMI (Body Mass Index), blood pressure, smoking habits, and more. By analyzing this dataset using SQL, we can gain valuable insights into how various factors impact insurance claims.

The dataset is a great resource for anyone looking to practice SQL queries, from beginners to advanced users, as it covers a wide range of practical scenarios like filtering data, aggregating results, and handling more complex conditional queries.

---

## Purpose of the Project

The purpose of this project is to:
1. Analyze insurance claims data and demographic patterns.
2. Provide insight into risk factors affecting insurance claims, such as health conditions and smoking status.
3. Help beginners, intermediate, and advanced learners practice their SQL skills using real-world data.

---

## Column Description

- **PatientID**: Unique identifier for each patient.
- **Age**: Age of the patient.
- **Gender**: Gender of the patient (Male/Female).
- **BMI**: Body Mass Index of the patient.
- **BloodPressure**: Blood pressure of the patient.
- **Diabetic**: Whether the patient is diabetic (Yes/No).
- **Children**: Number of children the patient has.
- **Smoker**: Whether the patient smokes (Yes/No).
- **Region**: Geographical region where the patient lives.
- **Claim**: Insurance claim amount.

---

## SQL Queries

### Beginner Level Questions
1. **Select all columns**: Retrieve all columns from the dataset.
2. **Unique regions**: Retrieve the list of unique regions.
3. **Total number of patients**: Find the total number of patients.
4. **Total number of smokers**: Get the total number of smokers.
5. **Diabetic patients**: Retrieve the Patient IDs and claims of diabetic patients.
6. **Total number of children**: Count how many children all patients have in total.
7. **Male patients**: Find all male patients.
8. **Patients with BMI > 25**: Select all columns for patients with a BMI greater than 25.
9. **Average age**: Get the average age of all patients.
10. **Patients from Southwest region**: Find the total number of patients from the 'Southwest' region.

### Intermediate Level Questions
1. **Total insurance claim for smokers**: Calculate the total insurance claim for patients who are smokers.
2. **Average blood pressure for diabetic patients**: Retrieve the average blood pressure of diabetic patients.
3. **Female patients with more than two children**: Find the total number of female patients with more than two children.
4. **Highest claim amount**: Get the highest claim amount by any patient.
5. **Patients aged above 40 with BMI > 30 and smokers**: List patients who are aged above 40, have a BMI greater than 30, and are smokers.
6. **Number of patients per region**: Retrieve the number of patients from each region.
7. **Minimum claim for non-diabetic patients**: Find the minimum claim amount for patients who are not diabetic.
8. **Total claim from Northeast region**: Calculate the total insurance claim amount for patients from the 'Northeast' region.
9. **Patients with claim > 10,000 and more than 2 children**: List all patients where the claim amount is greater than 10,000 and have more than two children.
10. **Diabetic patients by region**: Retrieve the number of diabetic patients in each region.

### Advanced Level Questions
1. **Total claims by gender and smoking status**: Calculate the total insurance claims for patients grouped by gender and smoking status.
2. **Top 3 regions with highest average claims for smokers**: Find the top 3 regions with the highest average claims for smokers.
3. **Diabetic patients above 50 with high blood pressure**: Identify the patients who are diabetic, above 50 years old, and have a blood pressure higher than average.
4. **Top 5 highest insurance claim patients**: Find the top 5 patients who have made the highest insurance claims.
5. **Percentage of smokers per region**: Calculate the percentage of smokers in each region.
6. **Average claim for patients with 2+ children by region**: Retrieve the average claim of patients with at least two children, segmented by region.
7. **Average claim for diabetic patients by smoking status and region**: Find the average claim amount for diabetic patients segmented by their smoking status and region.
8. **Top 5 patients by claim in each region**: List the top 5 patients in each region based on their claim amount.
9. **Variance of insurance claims per region**: Calculate the variance of insurance claims for each region.
10. **Maximum claim for smokers over 50 per region**: Find the maximum claim amount for smokers over 50 years old in each region.

### CampusX Questions
1. **Male patients from Southwest region**: Show records of male patients from the 'Southwest' region.
2. **Patients with BMI between 30 and 45**: Show all records of patients with BMI in the range of 30 to 45 (inclusive).
3. **Min/Max blood pressure for diabetic smokers**: Show the minimum and maximum blood pressure of diabetic patients who smoke, with column names as MinBP and MaxBP.
4. **Unique patients not from Southwest**: Find the number of unique patients who are not from the 'Southwest' region.
5. **Total claim amount from male smokers**: Calculate the total claim amount for male smokers.
6. **All records from South region**: Select all records of patients from the South region.
7. **Patients with normal blood pressure**: Find the number of patients with normal blood pressure (range: 90-120).
8. **Patients below 17 with normal BP**: Find the number of patients below 17 years of age who have normal blood pressure according to the formula:
   - Normal BP range = 80 + (age in years × 2) to 100 + (age in years × 2).
9. **Average claim for non-smoking diabetic females**: Calculate the average claim amount for non-smoking female patients who are diabetic.
10. **Update claim amount for PatientID 1234**: Write a SQL query to update the claim amount for the patient with PatientID = 1234 to 5000.
11. **Delete records for smokers with no children**: Write a SQL query to delete all records for patients who are smokers and have no children.

---

## SQL Code

### Begineer / Intermediate / Advanced Level Questions (30)
```sql
-- Beginner Level Questions:

-- 1.	Select all the columns from the dataset.

SELECT *
FROM insurance_data;

-- 2.	Retrieve the list of unique regions from the dataset.

SELECT DISTINCT region
FROM insurance_data;

-- 3.	Find the total number of patients from the dataset.

SELECT COUNT(PatientID) AS total_patients
FROM insurance_data;

-- 4.	Get the total number of smokers.

SELECT COUNT(smoker) AS total_smokers
FROM insurance_data
WHERE smoker = "Yes";

-- 5.	Retrieve the patient IDs and claims of patients who are diabetic.

SELECT PatientID, claim
FROM insurance_data
WHERE diabetic = "Yes";

-- 6.	Count how many children the patients have in total.

SELECT SUM(children) AS total_children
FROM insurance_data;

-- 7.	Find all the male patients from the dataset.

SELECT *
FROM insurance_data
WHERE gender = "male";

-- 8.	Select all columns for patients whose BMI is greater than 25.

SELECT *
FROM insurance_data
WHERE bmi > 25;

-- 9.	Get the average age of all patients.

SELECT ROUND(AVG(age),2) AS avg_age
FROM insurance_data;

-- 10.	Find the total number of patients from the 'Southwest' region.

SELECT COUNT(*)
FROM insurance_data
WHERE region = "southwest";

-- Intermediate Level Questions:

-- 1.	Calculate the total insurance claim for patients who are smokers.

SELECT SUM(claim) AS total_claim
FROM insurance_data
WHERE smoker = "Yes";

-- 2.	Retrieve the average blood pressure of patients who are diabetic.

SELECT AVG(bloodpressure) AS avg_bp
FROM insurance_data
WHERE diabetic = "Yes";

-- 3.	Find the total number of female patients with more than two children.

SELECT COUNT(*) AS female_patients -- WITH MORE THAN 2 CHILDREN
FROM insurance_data
WHERE gender = "female" AND children > 2;

-- 4.	Get the highest claim amount by any patient from the dataset.

SELECT PatientID, claim
FROM insurance_data
WHERE claim = ( SELECT MAX(claim)
FROM insurance_data);

-- ANOTHER WAY TO SOLVE SAME PROBLEM

SELECT PatientID, claim
FROM insurance_data
ORDER BY claim DESC
LIMIT 1;

-- 5.	List patients who are aged above 40, have a BMI greater than 30, and are smokers.

SELECT *
FROM insurance_data
WHERE age > 40 AND bmi > 30 AND smoker = "Yes";

-- 6.	Retrieve the number of patients from each region.

SELECT 
    region,
    COUNT(*) AS total_patients
FROM
    insurance_data
GROUP BY region
ORDER BY total_patients DESC;

-- 7.	Find the minimum claim amount for patients who are not diabetic.

SELECT MIN(claim)
FROM insurance_data
WHERE diabetic = "No";

-- 8.	Calculate the total insurance claim amount for patients from the 'Northeast' region.

SELECT ROUND(SUM(claim),2)
FROM insurance_data
WHERE region = "northeast";

-- 9.	List all patients where the claim amount is greater than 10,000 and who have more than two children.

SELECT *
FROM insurance_data
WHERE claim > 10000 AND children > 2;

-- 10.	Retrieve the number of diabetic patients in each region.

SELECT region, COUNT(*) AS patients
FROM insurance_data
WHERE diabetic = "Yes"
GROUP BY region
ORDER BY patients DESC;

-- Advanced Level Questions:

-- 1.	Calculate the total insurance claims for patients grouped by gender and smoking status.

SELECT 
    gender, smoker, SUM(claim) AS total_claim
FROM
    insurance_data
GROUP BY gender , smoker
ORDER BY gender , smoker , total_claim DESC;

-- 2.	Find the top 3 regions with the highest average claims for smokers.

SELECT 
    region,
    AVG(claim) AS avg_claim
FROM
    insurance_data
WHERE
    smoker = 'Yes'
GROUP BY region
ORDER BY avg_claim DESC
LIMIT 3;

-- 3.	Identify the patients who are diabetic, above 50 years old, and have a blood pressure higher than the average.

SELECT *
FROM insurance_data
WHERE diabetic = 'Yes' AND age > 50
        AND bloodpressure > (SELECT AVG(bloodpressure)
        FROM insurance_data);

-- 4.	Find the top 5 patients who have made the highest insurance claims.

SELECT *
FROM insurance_data
ORDER BY claim DESC
LIMIT 5;

-- 5.	Calculate the percentage of smokers in each region.

SELECT 
    region,
    CONCAT(ROUND((COUNT(CASE
        WHEN smoker = 'Yes' THEN 1
    END) / COUNT(*)) * 100,2), " ", "%") AS smoker_percent
FROM
    insurance_data
GROUP BY region
ORDER BY smoker_percent DESC;

-- 6.	Retrieve the average claim of patients with at least two children, segmented by region.

SELECT
	region,
    ROUND(AVG(claim),2) AS avg_claim  
FROM insurance_data
WHERE children = 2
GROUP BY region
ORDER BY avg_claim DESC;

-- 7.	Find the average claim amount for diabetic patients segmented by their smoking status and region.

SELECT region, smoker, ROUND(AVG(claim),2) AS avg_claim
FROM insurance_data
WHERE diabetic = "Yes"
GROUP BY region, smoker
ORDER BY avg_claim DESC;

-- 8.	List the top 5 patients in each region based on their claim amount.

SELECT
	PatientID,
	region,
    claim,
    row_num
FROM
	(	SELECT *,
		ROW_NUMBER() OVER (PARTITION BY region ORDER BY claim DESC) AS row_num 
FROM
	insurance_data) as sub_query
WHERE
	row_num <= 5
ORDER BY
	region DESC, claim DESC;

-- 9.	Calculate the variance of insurance claims for each region.

SELECT 
    region,
    ROUND(VARIANCE(claim), 2) AS claim_variance
FROM
    insurance_data
GROUP BY region;

-- 10.	Find the maximum claim amount for each region where the patient is a smoker and over 50 years old.

SELECT 
    region,
    MAX(claim) AS max_claim
FROM
    insurance_data
WHERE
    smoker = 'Yes' AND age > 50
GROUP BY region
ORDER BY max_claim DESC;
```

### CampusX Questions (11)
```sql
-- Perform The Following Queries

-- 1. Show records of 'male' patient from 'southwest' region.

SELECT *
FROM insurance_data
WHERE gender = "male" AND region = "southwest";

-- 2. Show all records having bmi in range 30 to 45 both inclusive.

SELECT *
FROM insurance_data
WHERE bmi BETWEEN 30 AND 45;

-- 3. Show minimum and maximum bloodpressure of diabetic patient who smokes. Make column names as MinBP and MaxBP respectively.

SELECT
	*,
	MIN(bloodpressure) OVER (PARTITION by diabetic) AS MinBP,
	MAX(bloodpressure) OVER (PARTITION by diabetic) AS MaxBP
FROM insurance_data
	WHERE diabetic = "Yes"
	AND smoker = "Yes";

-- 4. Find no of unique patients who are not from southwest region.

SELECT *
FROM insurance_data
WHERE region != "southwest";

-- 5. Total claim amount from male smoker.

SELECT SUM(claim) AS total_claim_amout
FROM insurance_data
WHERE gender = "male" AND smoker = "Yes";

-- 6. Select all records of south region.

SELECT *
FROM insurance_data
WHERE region LIKE "%south%";

-- 7. No of patient having normal blood pressure. Normal range[90-120].

SELECT *
FROM insurance_data
WHERE bloodpressure BETWEEN 90 AND 120;

-- 8. No of pateint below 17 years of age having normal blood pressure as per below formula -
--    - BP normal range = 80+(age in years × 2) to 100 + (age in years × 2)
--     - Note: Formula taken just for practice, don't take in real sense.

SELECT COUNT(*) AS no_of_patients
FROM insurance_data
WHERE age < 17
AND bloodpressure BETWEEN (80 + (age * 2)) AND (100 + (age * 2));


-- 9. What is the average claim amount for non-smoking female patients who are diabetic?

SELECT 
    AVG(claim) AS avg_claim
FROM
    insurance_data
WHERE
    gender = 'female'
    AND diabetic = 'Yes'
    AND smoker = 'No';

-- 10. Write a SQL query to update the claim amount for the patient with PatientID = 1234 to 5000.

UPDATE insurance_data
SET claim = 5000
WHERE PatientID = 1234;

-- Verify

SELECT *
FROM insurance_data
WHERE PatientID = 1234;

-- 11. Write a SQL query to delete all records for patients who are smokers and have no children.

DELETE
FROM insurance_data
WHERE children = 0 AND smoker = "Yes";
```

---

## Conclusion

This SQL project offers a comprehensive overview of how various factors such as age, gender, and smoking status influence insurance claims. Through practical SQL queries, we have uncovered valuable insights from the dataset, enabling a deeper understanding of insurance claim patterns. This project provides an excellent opportunity for learners at all levels to practice and enhance their SQL skills.

Feel free to explore the dataset and try out the queries yourself!
