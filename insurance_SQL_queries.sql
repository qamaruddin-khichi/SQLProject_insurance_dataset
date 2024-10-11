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