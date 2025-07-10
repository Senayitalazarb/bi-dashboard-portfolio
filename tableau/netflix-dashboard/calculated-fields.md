-- Movie Count
IF [Type] = "Movie" THEN 1 ELSE 0 END

-- TV Show Count
IF [Type] = "TV Show" THEN 1 ELSE 0 END

-- Year Added
YEAR([Date Added])

-- Total Content by Country
COUNTD([Show Id])

-- Genre Primary Tag
SPLIT([Genre], ",", 1)

-- Duration in Minutes (Extract Number)
INT(LEFT([Duration], FIND([Duration], " ") - 1))

-- Duration Category
IF INT(LEFT([Duration], FIND([Duration], " ") - 1)) <= 60 THEN "Short"
ELSE "Long"
END

-- Clean Rating
IF ISNULL([Rating]) OR [Rating] = "" THEN "Unrated"
ELSE [Rating]
END

-- Genre Ranking (for Top N)
INDEX()

-- Rating Category (Optional Styling)
IF [Rating] = "TV-MA" THEN "High"
ELSEIF [Rating] = "TV-14" THEN "Medium"
ELSE "Low"
END
