-- Basic Data Retrieval
-- Find All Recipes from a Specific Cuisine (e.g., Italian)
SELECT RecipeName, Description, CookingTime, DifficultyLevel
FROM Recipes
WHERE Cuisine = 'Italian';

-- Aggregation
-- Calculate the Average Rating for Each Recipe
SELECT r.RecipeName, AVG(rt.Rating) AS AverageRating
FROM Recipes r
JOIN Ratings rt ON r.RecipeID = rt.RecipeID
GROUP BY r.RecipeName
ORDER BY AverageRating DESC;

-- Join
-- List All Ingredients Required for a Specific Recipe (e.g., RecipeID = 1) 
SELECT r.RecipeName, i.IngredientName, ri.Quantity, ri.Unit
FROM RecipeIngredients ri
JOIN Ingredients i ON ri.IngredientID = i.IngredientID
JOIN Recipes r ON ri.RecipeID = r.RecipeID
WHERE r.RecipeID = 1;

-- Having
-- Find Recipes with an Average Rating Lower Than 3
SELECT RecipeName
FROM Recipes
WHERE RecipeID IN (
    SELECT RecipeID
    FROM Ratings
    GROUP BY RecipeID
    HAVING AVG(Rating) < 3
);

-- Rank
-- Find the Top 3 Highest-Rated Recipes
SELECT r.RecipeName, AVG(rt.Rating) AS AverageRating
FROM Recipes r
JOIN Ratings rt ON r.RecipeID = rt.RecipeID
GROUP BY r.RecipeName
ORDER BY AverageRating DESC
LIMIT 3;

-- Where
-- Find All Recipes that are Either 'Easy' or Have a Cooking Time Less Than 30 Minutes
SELECT RecipeName, Cuisine, CookingTime, DifficultyLevel
FROM Recipes
WHERE DifficultyLevel = 'Easy' OR CookingTime < '30 min';

-- Update
-- Update the Description of a Specific Recipe (e.g., RecipeID = 1)
UPDATE Recipes
SET Description = 'A classic Italian pasta dish with a creamy sauce'
WHERE RecipeID = 1;

-- Delete
-- Delete Ratings that are Lower Than 2
DELETE FROM Ratings
WHERE Rating < 2;

-- Limit
-- Find the Most Common Ingredient Used in Recipes
SELECT i.IngredientName, COUNT(ri.IngredientID) AS UsageCount
FROM RecipeIngredients ri
JOIN Ingredients i ON ri.IngredientID = i.IngredientID
GROUP BY i.IngredientName
ORDER BY UsageCount DESC
LIMIT 1;
