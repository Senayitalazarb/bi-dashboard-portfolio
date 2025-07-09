
----------------------------------------------------
--  Core KPI Queries
----------------------------------------------------

-- 1. Total Interviews
SELECT COUNT(*) AS Total_Interviews
FROM Interview_Dataset;

-- 2. Mentor Preparation %
SELECT 
    SUM(MentorPrepTime) * 1.0 / NULLIF(SUM(ExpectedPrepTime), 0) AS MentorPrepPercent
FROM Interview_Dataset;

-- 3. Average Preparation Score %
SELECT 
    AVG(PrepScore) AS PrepScorePercent
FROM Interview_Dataset;

-- 4. Average Interview Score %
SELECT 
    AVG(InterviewScore) AS InterviewScorePercent
FROM Interview_Dataset;

-- 5. Interview Score Not Scored %
SELECT 
    COUNT(*) FILTER (WHERE InterviewScore IS NULL) * 1.0 / COUNT(*) AS InterNotScoredPercent
FROM Interview_Dataset;

-- 6. Recruiter/Technical Interview Ratio
SELECT 
    COUNT(*) FILTER (WHERE InterviewType = 'Recruiter') * 1.0 /
    NULLIF(COUNT(*) FILTER (WHERE InterviewType = 'Technical'), 0) AS RecTechRatio
FROM Interview_Dataset;

----------------------------------------------------
--  Week-over-Week Change Calculations
----------------------------------------------------

-- Assuming 'InterviewDate' is of type DATE
-- and a helper table `Calendar` with columns [InterviewDate], [WeekNumber]

-- 7. PrepScore WoW % Change
WITH scores_by_week AS (
    SELECT 
        c.WeekNumber,
        AVG(i.PrepScore) AS AvgPrepScore
    FROM Interview_Dataset i
    JOIN Calendar c ON i.InterviewDate = c.InterviewDate
    GROUP BY c.WeekNumber
)
SELECT 
    curr.WeekNumber AS CurrentWeek,
    ((curr.AvgPrepScore - prev.AvgPrepScore) / NULLIF(prev.AvgPrepScore, 0)) AS WoW_PrepScorePercent
FROM scores_by_week curr
JOIN scores_by_week prev ON curr.WeekNumber = prev.WeekNumber + 1;

-- 8. InterviewScore WoW % Change
WITH scores_by_week AS (
    SELECT 
        c.WeekNumber,
        AVG(i.InterviewScore) AS AvgInterviewScore
    FROM Interview_Dataset i
    JOIN Calendar c ON i.InterviewDate = c.InterviewDate
    GROUP BY c.WeekNumber
)
SELECT 
    curr.WeekNumber AS CurrentWeek,
    ((curr.AvgInterviewScore - prev.AvgInterviewScore) / NULLIF(prev.AvgInterviewScore, 0)) AS WoW_InterviewScorePercent
FROM scores_by_week curr
JOIN scores_by_week prev ON curr.WeekNumber = prev.WeekNumber + 1;

-- 9. WoW % Change in Total Interviews
WITH interviews_by_week AS (
    SELECT 
        c.WeekNumber,
        COUNT(*) AS TotalInterviews
    FROM Interview_Dataset i
    JOIN Calendar c ON i.InterviewDate = c.InterviewDate
    GROUP BY c.WeekNumber
)
SELECT 
    curr.WeekNumber AS CurrentWeek,
    ((curr.TotalInterviews - prev.TotalInterviews) / NULLIF(prev.TotalInterviews, 0)) AS WoW_InterviewCountChange
FROM interviews_by_week curr
JOIN interviews_by_week prev ON curr.WeekNumber = prev.WeekNumber + 1;

----------------------------------------------------
--  Deeper Analysis Queries
----------------------------------------------------

-- 10. Avg Interview Score by Mentor
SELECT 
    Mentor,
    COUNT(*) AS InterviewCount,
    AVG(InterviewScore) AS AvgInterviewScore,
    AVG(PrepScore) AS AvgPrepScore,
    AVG(MentorPrepTime) AS AvgMentorPrepTime
FROM Interview_Dataset
GROUP BY Mentor
ORDER BY AvgInterviewScore DESC;

-- 11. Score Distribution by Applicant
SELECT 
    Applicant,
    COUNT(*) AS TotalInterviews,
    AVG(PrepScore) AS AvgPrepScore,
    AVG(InterviewScore) AS AvgInterviewScore,
    COUNT(*) FILTER (WHERE InterviewScore IS NULL) * 1.0 / COUNT(*) AS NotScoredRate
FROM Interview_Dataset
GROUP BY Applicant
ORDER BY AvgInterviewScore DESC;

-- 12. Most Common Job Titles in Interview Word Cloud
SELECT 
    JobTitle,
    COUNT(*) AS Frequency
FROM Interview_Dataset
GROUP BY JobTitle
ORDER BY Frequency DESC;

-- 13. Satisfaction Risk: Applicants with Low Prep and Interview Score
SELECT 
    Applicant,
    AVG(PrepScore) AS AvgPrepScore,
    AVG(InterviewScore) AS AvgInterviewScore
FROM Interview_Dataset
GROUP BY Applicant
HAVING AVG(PrepScore) < 50 AND AVG(InterviewScore) < 60
ORDER BY AvgInterviewScore;



