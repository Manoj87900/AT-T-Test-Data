-- Create the view called "FinalResult"
CREATE VIEW FinalResult AS

-- Select the ID column from the AT&TTestData table
SELECT ID,

-- Count the number of 'Pass' results for each ID and label it as PassCount
       COUNT(CASE WHEN Result = 'Pass' THEN 1 END) AS PassCount,
       
-- Count the number of 'Fail' results for each ID and label it as FailCount
       COUNT(CASE WHEN Result = 'Fail' THEN 1 END) AS FailCount,

-- Select the latest time when 'Pass' result was recorded for each ID and label it as LatestPassTime
       MAX(CASE WHEN Result = 'Pass' THEN TestTime END) AS LatestPassTime,
       
-- Select the earliest time when 'Fail' result was recorded for each ID and label it as EarliestFailTime
       MIN(CASE WHEN Result = 'Fail' THEN TestTime END) AS EarliestFailTime,
       
 -- Compare the number of Pass and Fail results, if Pass is greater than Fail, label it as 'Pass', if Pass equal to Fail, label it as 'Pass' otherwise label it as 'Fail' and label it as FinalResult 
       CASE 
          WHEN COUNT(CASE WHEN Result = 'Pass' THEN 1 END) > COUNT(CASE WHEN Result = 'Fail' THEN 1 END) THEN 'Pass'
          WHEN COUNT(CASE WHEN Result = 'Pass' THEN 1 END) = COUNT(CASE WHEN Result = 'Fail' THEN 1 END) THEN 'Pass'
          ELSE 'Fail'
       END AS FinalResult
       
-- Select the data from table AT&TTestData
FROM [AT&TTestData]

-- Group the data by ID
GROUP BY ID;
