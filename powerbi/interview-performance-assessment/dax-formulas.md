#  DAX Measures for Interview Performance Assessment Dashboard

This document contains all the DAX measures used in the Interview Performance Assessment Dashboard. These measures support KPI calculations, trend analysis, and week-over-week comparisons.

---

##  Core KPI Measures

```dax
-- Total Interviews
Total Interviews = COUNTROWS(Interview_Dataset)

-- Mentor Preparation % (MentorPrep%)
MentorPrep% = 
DIVIDE(
    SUM(Interview_Dataset[MentorPrepTime]),
    SUM(Interview_Dataset[ExpectedPrepTime]),
    0
)

-- Prep Score %
PrepScore% = 
AVERAGE(Interview_Dataset[PrepScore])

-- Interview Score %
InterviewScore% = 
AVERAGE(Interview_Dataset[InterviewScore])

-- Interview Score Not Scored %
InterNotScored% =
DIVIDE(
    CALCULATE(
        COUNTROWS(Interview_Dataset), 
        Interview_Dataset[InterviewScore] = BLANK()
    ),
    [Total Interviews],
    0
)

-- Recruit/Tech Interview Ratio
RecTech Ratio = 
DIVIDE(
    CALCULATE(
        COUNTROWS(Interview_Dataset), 
        Interview_Dataset[InterviewType] = "Recruiter"
    ),
    CALCULATE(
        COUNTROWS(Interview_Dataset), 
        Interview_Dataset[InterviewType] = "Technical"
    ),
    0
)

-- WoW % Change in Prep Score
WoW PrepScore% =
VAR CurrentWeek = MAX(Calendar[WeekNumber])
VAR LastWeek = CurrentWeek - 1
VAR ThisWeekValue = CALCULATE([PrepScore%], Calendar[WeekNumber] = CurrentWeek)
VAR LastWeekValue = CALCULATE([PrepScore%], Calendar[WeekNumber] = LastWeek)
RETURN 
    DIVIDE(ThisWeekValue - LastWeekValue, LastWeekValue, 0)

-- WoW % Change in Interview Score
WoW InterviewScore% =
VAR CurrentWeek = MAX(Calendar[WeekNumber])
VAR LastWeek = CurrentWeek - 1
VAR ThisWeekValue = CALCULATE([InterviewScore%], Calendar[WeekNumber] = CurrentWeek)
VAR LastWeekValue = CALCULATE([InterviewScore%], Calendar[WeekNumber] = LastWeek)
RETURN 
    DIVIDE(ThisWeekValue - LastWeekValue, LastWeekValue, 0)

-- Flag if Interview is Scored
IsScored = 
IF(NOT ISBLANK(Interview_Dataset[InterviewScore]), 1, 0)

-- Total Interviews This Week
Interviews This Week = 
CALCULATE(
    [Total Interviews],
    FILTER(
        ALL(Calendar),
        Calendar[WeekNumber] = MAX(Calendar[WeekNumber])
    )
)

-- Total Interviews Last Week
Interviews Last Week = 
CALCULATE(
    [Total Interviews],
    FILTER(
        ALL(Calendar),
        Calendar[WeekNumber] = MAX(Calendar[WeekNumber]) - 1
    )
)

-- WoW Change in Total Interviews
WoW TotalInterviews% =
VAR Current = [Interviews This Week]
VAR Last = [Interviews Last Week]
RETURN 
    DIVIDE(Current - Last, Last, 0)

