-- We will use various queries to explore our table
-- Note: we do not need Joins, Unions,etc since we only have one table for (canada immigration) 
-- Note: we will not delete (0) values because in some years, there were no immigrants to Canada

--select the database to use:
USE canada_immigration

-- Q1: write a query to find any NULL values in Country coulumn 

SELECT * 
from canada_immigration_project 
WHERE Country IS NULL;

--Q2:  Write a query to find all NON-NULL values in the year_2010 column 

SELECT * 
from canada_immigration_project 
WHERE year_2010 IS NOT NULL;

-- Q3: Write a query to find all rows for immigrants where continent they come from is Asia and region is Southern Asia

SELECT * 
from canada_immigration_project
WHERE Continent = 'Asia' AND Region = 'Southern Asia';

-- Q4: Write a query to return all numbers of immigrants for all years where country is India 

SELECT *
FROM canada_immigration_project
WHERE Country = 'India' 

-- Q5: write a query to return numbers of immigrants from Afghanistan to Canada in 2009

SELECT Country, year_2009
FROM canada_immigration_project 
WHERE Country = 'Afghanistan' and year_2009 IS NOT NULL;


-- Q6: write a query to return all countries that immigrants came from where continent is Africa and the year is 2004

SELECT Country, Continent, year_2004
FROM canada_immigration_project
WHERE Continent = 'Africa';

-- Q7: write a query to return all immigrants to canada in 2007 for all countries in all cotinents except Europe
SELECT Continent, Country, year_2007
FROM canada_immigration_project 
WHERE Continent <> 'Europe' 

-- write a query to return all immigrants where continent is Asia, region is Wstern Asia, and the year is 2005

SELECT Continent, Country, Region, year_2005
FROM canada_immigration_project 
WHERE Continent = 'Asia' AND Region = 'Western Asia';


-- Q9: Write a query to return numbers of immigrants from continent of Europe for the years: 2003, 2004, 2006

SELECT Continent, Country, year_2003, year_2004, year_2006

FROM canada_immigration_project 

WHERE Continent = 'Europe' 

-- Q10: Write a query to return the continent, country WHERE AREA number is 904 and REG number is 915

SELECT Continent, Country, AREA, REG 

FROM canada_immigration_project

WHERE REG = 915 AND AREA = 904;

-- Q11: write a query to return any possible null values in the years columns 
-- Note: we have to use dynamic SQL to create Year and Immigrant_Count columns to specify which years to include and return as immigrant_Count

SELECT Country, Year, Immigrants_Count
FROM canada_immigration_project
UNPIVOT (Immigrants_Count FOR Year IN (year_2000, year_2001, year_2002, year_2003, year_2004, year_2005,
                                    year_2006, year_2007, year_2008, year_2009, year_2010, year_2011, year_2012, year_2013))   
 AS p
WHERE Immigrants_Count IS NULL;

-- Q12: write a query to return all immigrants from Iraq, Bahrain, Syria and Croatia to Canada in the years 2004 and 2007 

SELECT Country, year_2004, year_2007 
FROM canada_immigration_project
WHERE Country IN ('Iraq', 'Barain', 'Syria', 'Croatia')
ORDER BY year_2004, year_2007;


-- Q13: write a query to find total immigrants to canada from Sweden, Bulgaria, Russia, China and India in 2002 and 2011

SELECT Country,SUM(year_2002) AS Total_for_2002, SUM(year_2011) AS Total_for_2011
FROM canada_immigration_project
WHERE Country IN ('Sweden', 'Bulgaria', 'Russia', 'China', 'India')

GROUP BY Country;


-- Q14: write a query to return numbers of immigrants in 2007 per each country where numbers exceeded or equaled 100

SELECT Country, SUM(year_2007) AS Total_for_2007
FROM canada_immigration_project 
WHERE year_2007 >= 100
GROUP BY COUNTRY
order by Total_for_2007;

-- Q15: Write a query to return all immigrants from Western Africa for all countries in 2001 where numbers per country >= 35


SELECT Continent, Country, Region, SUM(year_2001) AS Total_for_2001 
FROM canada_immigration_project 
WHERE Continent = 'Africa' AND Region = 'Western Africa' AND year_2001 >= 35
GROUP BY Continent, Country, Region 
ORDER BY Total_for_2001;








