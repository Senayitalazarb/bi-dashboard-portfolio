-- Emergency Room Visit Report – SQL Prep and KPI Calculations

-- STEP 1: Data Cleaning & Preparation
SELECT 
    VisitID,
    PatientID,
    Date,
    EXTRACT(DAY FROM Date) AS DayOfMonth,
    EXTRACT(MONTH FROM Date) AS Month,
    EXTRACT(YEAR FROM Date) AS Year,
    EXTRACT(DOW FROM Date) AS Weekday,
    department_referral,
    Moments AS WaitTimeMinutes,
    AdjustedPatientSatScore,
    Age,
    CASE 
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 35 THEN '18–35'
        WHEN Age BETWEEN 36 AND 55 THEN '36–55'
        WHEN Age BETWEEN 56 AND 75 THEN '56–75'
        ELSE '75+'
    END AS AgeGroup
FROM 
    Patient_Dataset
WHERE 
    VisitID IS NOT NULL;


-- STEP 2: Total Visits
SELECT COUNT(*) AS TotalVisit
FROM Patient_Dataset;


-- STEP 3: Satisfaction Rate
SELECT AVG(AdjustedPatientSatScore) AS SatisfactionRate
FROM Patient_Dataset;


-- STEP 4: Average Wait Time
SELECT AVG(Moments) AS AvgWaitTime
FROM Patient_Dataset;


-- STEP 5: Referred Patient Percentage
SELECT 
    100.0 * SUM(CASE WHEN department_referral = TRUE THEN 1 ELSE 0 END) / COUNT(*) AS ReferredPatientPct
FROM Patient_Dataset;


-- STEP 6: Visit Week-over-Week % Change
WITH WeeklyVisits AS (
    SELECT 
        DATE_TRUNC('week', Date) AS WeekStart,
        COUNT(*) AS WeeklyVisitCount
    FROM Patient_Dataset
    GROUP BY DATE_TRUNC('week', Date)
),
WoWChange AS (
    SELECT 
        WeekStart,
        WeeklyVisitCount,
        LAG(WeeklyVisitCount) OVER (ORDER BY WeekStart) AS PreviousWeekCount
    FROM WeeklyVisits
)
SELECT 
    WeekStart,
    WeeklyVisitCount,
    PreviousWeekCount,
    100.0 * (WeeklyVisitCount - PreviousWeekCount) / NULLIF(PreviousWeekCount, 0) AS VisitWoWPercent
FROM WoWChange;


-- STEP 7: Wait Time Week-over-Week % Change
WITH WeeklyWait AS (
    SELECT 
        DATE_TRUNC('week', Date) AS WeekStart,
        AVG(Moments) AS AvgWaitTime
    FROM Patient_Dataset
    GROUP BY DATE_TRUNC('week', Date)
),
WaitWoW AS (
    SELECT 
        WeekStart,
        AvgWaitTime,
        LAG(AvgWaitTime) OVER (ORDER BY WeekStart) AS PreviousAvgWait
    FROM WeeklyWait
)
SELECT 
    WeekStart,
    AvgWaitTime,
    PreviousAvgWait,
    100.0 * (AvgWaitTime - PreviousAvgWait) / NULLIF(PreviousAvgWait, 0) AS WaitWoWPercent
FROM WaitWoW;


-- STEP 8: Avg Satisfaction by Age Group
SELECT 
    CASE 
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 35 THEN '18–35'
        WHEN Age BETWEEN 36 AND 55 THEN '36–55'
        WHEN Age BETWEEN 56 AND 75 THEN '56–75'
        ELSE '75+'
    END AS AgeGroup,
    AVG(AdjustedPatientSatScore) AS AvgSatScore
FROM Patient_Dataset
GROUP BY AgeGroup;

