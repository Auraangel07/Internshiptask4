-- Internship Task 4 - SQL Query Collection (42 Total)
-- Table: data
-- Author: Aura 

-- 1. Sample of 10 rows
SELECT * FROM data LIMIT 10;

-- 2. Total users by country
SELECT country, COUNT(*) AS total_users
FROM data
GROUP BY country
ORDER BY total_users DESC;

-- 3. Average products sold per country
SELECT country, AVG(productsSold) AS avg_sold
FROM data
GROUP BY country
ORDER BY avg_sold DESC;

-- 4. Gender distribution
SELECT gender, COUNT(*) AS gender_count
FROM data
GROUP BY gender;

-- 5. Most common languages
SELECT language, COUNT(*) AS language_count
FROM data
GROUP BY language
ORDER BY language_count DESC;

-- 6. Android but not iOS users
SELECT identifierHash
FROM data
WHERE hasAndroidApp = 'True' AND hasIosApp = 'False';

-- 7. iOS but not Android users
SELECT identifierHash
FROM data
WHERE hasIosApp = 'True' AND hasAndroidApp = 'False';

-- 8. Users with both apps
SELECT identifierHash
FROM data
WHERE hasIosApp = 'True' AND hasAndroidApp = 'True';

-- 9. Users without profile picture
SELECT identifierHash
FROM data
WHERE hasProfilePicture = 'False';

-- 10. Users who listed more than 50 products
SELECT identifierHash, productsListed
FROM data
WHERE productsListed > 50;

-- 11. Top 10 users by products wished
SELECT identifierHash, productsWished
FROM data
ORDER BY productsWished DESC
LIMIT 10;

-- 12. Users with pass rate > 80%
SELECT identifierHash, productsPassRate
FROM data
WHERE productsPassRate > 80;

-- 13. Users inactive > 1 year
SELECT identifierHash, daysSinceLastLogin
FROM data
WHERE daysSinceLastLogin > 365;

-- 14. Users active within last 7 days
SELECT identifierHash
FROM data
WHERE daysSinceLastLogin <= 7;

-- 15. Top 10 users by followers
SELECT identifierHash, socialNbFollowers
FROM data
ORDER BY socialNbFollowers DESC
LIMIT 10;

-- 16. Avg product pass rate by country
SELECT country, AVG(productsPassRate) AS avg_pass
FROM data
GROUP BY country
ORDER BY avg_pass DESC;

-- 17. Users who bought more than they wished
SELECT identifierHash, productsBought, productsWished
FROM data
WHERE productsBought > productsWished;

-- 18. Senior users (5+ years)
SELECT identifierHash, seniorityAsYears
FROM data
WHERE seniorityAsYears >= 5;

-- 19. Signup method popularity
SELECT signup_method, COUNT(*) AS total_signups
FROM data
GROUP BY signup_method
ORDER BY total_signups DESC;

-- 20. Country-language pair distribution
SELECT country, language, COUNT(*) AS users
FROM data
GROUP BY country, language
ORDER BY users DESC;

-- 21. Users with no products listed
SELECT identifierHash
FROM data
WHERE productsListed = 0;

-- 22. Users with no products sold
SELECT identifierHash
FROM data
WHERE productsSold = 0;

-- 23. Active top sellers
SELECT identifierHash, productsSold, daysSinceLastLogin
FROM data
WHERE productsSold > 100 AND daysSinceLastLogin < 30;

-- 24. Total products sold by gender
SELECT gender, SUM(productsSold) AS total_sold
FROM data
GROUP BY gender;

-- 25. View: New sellers (joined < 6 months)
CREATE VIEW NewSellers AS
SELECT identifierHash, seniorityAsMonths
FROM data
WHERE seniorityAsMonths < 6;

-- 26. Users with 0 followers AND 0 follows
SELECT identifierHash
FROM data
WHERE socialNbFollowers = 0 AND socialNbFollows = 0;

-- 27. Subquery: Above-average sellers in their country
SELECT identifierHash, productsSold, country
FROM data
WHERE productsSold > (
    SELECT AVG(productsSold) FROM data AS d2
    WHERE d2.country = data.country
);

-- 28. Users using French language
SELECT identifierHash
FROM data
WHERE language LIKE '%fr%';

-- 29. Country with highest avg products bought
SELECT country, AVG(productsBought) AS avg_bought
FROM data
GROUP BY country
ORDER BY avg_bought DESC
LIMIT 1;

-- 30. Create index on country
CREATE INDEX idx_country ON data(country);

-- 31. Top 5 users with most productsLiked
SELECT identifierHash, socialProductsLiked
FROM data
ORDER BY socialProductsLiked DESC
LIMIT 5;

-- 32. Average seniority (years) by country
SELECT country, AVG(seniorityAsYears) AS avg_seniority
FROM data
GROUP BY country;

-- 33. Country with most iOS users
SELECT country, COUNT(*) AS ios_users
FROM data
WHERE hasIosApp = 'True'
GROUP BY country
ORDER BY ios_users DESC
LIMIT 1;

-- 34. Female users with Android app
SELECT identifierHash
FROM data
WHERE gender = 'female' AND hasAndroidApp = 'True';

-- 35. Male users with high pass rate (>75)
SELECT identifierHash
FROM data
WHERE gender = 'male' AND productsPassRate > 75;

-- 36. Users who signed up more than 10 years ago
SELECT identifierHash, seniorityAsYears
FROM data
WHERE seniorityAsYears > 10;

-- 37. Total products bought by country
SELECT country, SUM(productsBought) AS total_bought
FROM data
GROUP BY country
ORDER BY total_bought DESC;

-- 38. Count of users by civilityTitle
SELECT civilityTitle, COUNT(*) AS total
FROM data
GROUP BY civilityTitle;

-- 39. Countries with both iOS and Android dominance
SELECT country, COUNT(*) AS dual_app_users
FROM data
WHERE hasIosApp = 'True' AND hasAndroidApp = 'True'
GROUP BY country
ORDER BY dual_app_users DESC;

-- 40. Percentage of users with profile pictures
SELECT 
  (COUNT(CASE WHEN hasProfilePicture = 'True' THEN 1 END) * 100.0 / COUNT(*)) AS percent_with_picture
FROM data;

-- 41. View: High Engagement Users
CREATE VIEW HighEngagement AS
SELECT identifierHash, socialNbFollowers, socialNbFollows, productsListed
FROM data
WHERE socialNbFollowers > 100 AND productsListed > 50;

-- 42. Users with most product interaction (wished + bought)
SELECT identifierHash, (productsWished + productsBought) AS total_interactions
FROM data
ORDER BY total_interactions DESC
LIMIT 10;
