-- Total Movies
SELECT COUNT(*) AS Movie_Count
FROM netflix_data
WHERE Type = 'Movie';

-- Total TV Shows
SELECT COUNT(*) AS TVShow_Count
FROM netflix_data
WHERE Type = 'TV Show';

-- Total Shows by Country
SELECT Country, COUNT(DISTINCT Title) AS Total_Shows
FROM netflix_data
GROUP BY Country
ORDER BY Total_Shows DESC;

-- Top Genres (split primary genre)
SELECT TRIM(SPLIT_PART(Genre, ',', 1)) AS Primary_Genre, COUNT(*) AS Count
FROM netflix_data
GROUP BY Primary_Genre
ORDER BY Count DESC;

-- Clean Ratings
SELECT 
  CASE 
    WHEN Rating IS NULL OR Rating = '' THEN 'Unrated'
    ELSE Rating
  END AS Clean_Rating,
  COUNT(*) AS Rating_Count
FROM netflix_data
GROUP BY Clean_Rating
ORDER BY Rating_Count DESC;

-- Titles by Year Added
SELECT EXTRACT(YEAR FROM "Date Added") AS Year_Added, COUNT(*) AS Titles_Added
FROM netflix_data
WHERE "Date Added" IS NOT NULL
GROUP BY Year_Added
ORDER BY Year_Added;

-- Duration in Minutes (converted to integer)
SELECT 
  Title,
  CASE 
    WHEN "Duration" LIKE '%min%' THEN CAST(SPLIT_PART(Duration, ' ', 1) AS INTEGER)
    ELSE NULL
  END AS Duration_Minutes
FROM netflix_data
WHERE Duration LIKE '%min%';

-- Duration Category
SELECT 
  Title,
  CASE 
    WHEN CAST(SPLIT_PART(Duration, ' ', 1) AS INTEGER) <= 60 THEN 'Short'
    ELSE 'Long'
  END AS Duration_Category
FROM netflix_data
WHERE Duration LIKE '%min%';

-- Top Countries by Rating
SELECT Country, Rating, COUNT(*) AS Count
FROM netflix_data
WHERE Rating IS NOT NULL
GROUP BY Country, Rating
ORDER BY Country, Count DESC;

-- Content Growth Over Time (by release year)
SELECT "Release Year", COUNT(*) AS Titles_Released
FROM netflix_data
GROUP BY "Release Year"
ORDER BY "Release Year";

