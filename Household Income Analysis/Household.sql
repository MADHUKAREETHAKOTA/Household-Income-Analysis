-- Active: 1749535200680@@127.0.0.1@3306@household
USE household;

SELECT * FROM `data`;

--SQL Query to Flag Anomalies
SELECT
    *,
    CASE
        WHEN (
Age < 18
            AND Marital_Status != 'Single'
        )
        OR (Work_Experience > Age - 15)
        OR (
            Number_of_Dependents > Household_Size
        ) THEN 'Yes'
        ELSE 'No'
    END AS Is_Anomaly
FROM data;

-- Add the new column (once)
ALTER TABLE data ADD COLUMN Is_Anomaly VARCHAR(3);

-- Update each row based on your rules
UPDATE data
SET
    Is_Anomaly = CASE
        WHEN (
            Age < 18
            AND Marital_Status != 'Single'
        )
        OR (Work_Experience > Age - 15)
        OR (
            Number_of_Dependents > Household_Size
        ) THEN 'Yes'
        ELSE 'No'
    END;

--Average Income by Homeownership Status
SELECT
    `Homeownership_Status`,
    ROUND(AVG(Income), 2) as `Average_Income`
FROM `data`
WHERE `Is_Anomaly` = 'No'
GROUP BY `Homeownership_Status`;

--Average Income by Education Level
SELECT
    `Education_Level`,
    ROUND(AVG(income), 2) as `Average_Income`
FROM `data`
where `Is_Anomaly` = 'No'
GROUP BY `Education_Level`;

--Income by Occupation
SELECT Occupation, ROUND(AVG(Income), 2) as `Average_Income`
FROM `data`
WHERE `Is_Anomaly` = 'No'
GROUP BY `Occupation`
ORDER BY AVG(Income) DESC;

-- Income Distribution by Age Brackets
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 29  THEN 'Young Adults (18-29)'
        WHEN Age BETWEEN 30 AND 39  THEN 'Young Professionals (30-39)'
        WHEN Age BETWEEN 40 AND 49  THEN 'Mid-Career Professionals(40-49)'
        WHEN Age BETWEEN 50 AND 59  THEN 'Established Adults (50-59)'
        WHEN Age BETWEEN 60 AND 70  THEN 'Seniors (60-70)'
        ELSE 'Out of Range'
    END AS Age_Group,
    COUNT(*) AS Total_People,
    ROUND(AVG(Income), 2) AS `Average_Income`
FROm `data`
WHERE `Is_Anomaly` = 'No'
GROUP BY Age_Group
ORDER BY Total_People;

--Income vs Household Size
SELECT
    `Household_Size`,
    COUNT(*) AS Total_Households,
    ROUND(AVG(Income), 2) AS `Average_Income`
FROM `data`
WHERE `Is_Anomaly` = 'No'
GROUP BY `Household_Size`
ORDER BY `Household_Size`;

--Income by Employment Status

SELECT
    `Employment_Status`,
    ROUND(AVG(Income), 2) as `Average_Income`
FROM `data`
WHERE `Is_Anomaly` = 'No'
GROUP BY `Employment_Status`;

-- Income vs Work Experience
SELECT
    CASE
        WHEN Work_Experience BETWEEN 0 AND 5  THEN '0-5 yrs'
        WHEN Work_Experience BETWEEN 6 AND 10  THEN '6-10 yrs'
        WHEN Work_Experience BETWEEN 11 AND 15  THEN '11-15 yrs'
        WHEN Work_Experience > 15 THEN '16 + yrs'
        ELSE 'Unknown'
    END AS Experience_Group,
    COUNT(*) AS Total_Individuals,
    ROUND(AVG(Income), 2) AS `Average_Income`
FROM `data`
WHERE `Is_Anomaly` = 'No'
GROUP BY Experience_Group
ORDER BY Experience_Group;

--Per Capita Income
SELECT
    `Household_Size`,
    COUNT(*) AS Total_Households,
    ROUND(AVG(Income / Household_Size),2) AS Avg_Per_Capita_Income
FROM `data`
WHERE `Is_Anomaly` = 'No'
GROUP BY `Household_Size`
ORDER BY `Household_Size`;

-- Gender Pay Gap
SELECT
    `Gender`,
    COUNT(*) AS Total_Individuals,
    ROUND(AVG(Income), 2) AS Avg_Income
FROM `data`
WHERE `Is_Anomaly` = 'No'
GROUP BY `Gender`;

--Income by Location Type
SELECT
    `Location`,
    COUNT(*) AS Total_Individuals,
    ROUND(AVG(Income), 2) AS `Average_Income`
FROM `data`
WHERE `Is_Anomaly` = 'No'
GROUP BY `Location`;