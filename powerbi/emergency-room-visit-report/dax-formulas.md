# Emergency Room Visit Report – DAX Formulas

```dax
// Total Visit
Total Visit = COUNTROWS(Patient_Dataset)

// Satisfaction Rate
Satisfaction Rate = AVERAGE(Patient_Dataset[AdjustedPatientSatScore])

// Average Wait Time
Avg Wait Time = AVERAGE(Patient_Dataset[Moments])

// Referred Patient %
Referred Patient % = 
DIVIDE(
    CALCULATE(COUNTROWS(Patient_Dataset), Patient_Dataset[department_referral] = TRUE()),
    COUNTROWS(Patient_Dataset)
)

// Visit Week-over-Week %
Visit WoW% = 
VAR CurrentWeek =
    CALCULATE([Total Visit])
VAR PreviousWeek =
    CALCULATE([Total Visit], DATEADD(Calander[Date], -7, DAY))
RETURN
DIVIDE(CurrentWeek - PreviousWeek, PreviousWeek)

// Wait Time Week-over-Week %
Wait Time WoW% = 
VAR Current =
    CALCULATE([Avg Wait Time])
VAR Previous =
    CALCULATE([Avg Wait Time], DATEADD(Calander[Date], -7, DAY))
RETURN
DIVIDE(Current - Previous, Previous)

// Satisfaction Score by Age Group
Avg Sat Score by Age Group = 
CALCULATE(
    AVERAGE(Patient_Dataset[AdjustedPatientSatScore]),
    ALLEXCEPT(Patient_Dataset, Patient_Dataset[Age Group])
)
