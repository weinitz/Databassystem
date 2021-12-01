#1
SELECT Age FROM players WHERE SSN = 199604072386
#2
SELECT StartDate FROM competition WHERE "Big Golf Cup Skövde" = competition.Name
#3
SELECT Material from clubs WHERE 199604072386 = SSN
#4
SELECT * from `jackets` WHERE 199604072386 = SSN
#5
SELECT Contestants.CompetionName, Players.Name
FROM Contestants
         INNER JOIN Players ON Players.SSN = Contestants.PlayerSSN;
#6
SELECT Rain.WindForce
FROM Weather
         INNER JOIN Rain ON Rain.RainType = Weather.RainType;
#7
SELECT * FROM Players WHERE 30 > Age;
#8
DELETE FROM Jackets WHERE SSN = 199604072386;
#9
DELETE FROM Players WHERE SSN = 198904032380;
# 10.
SELECT AVG(Age) FROM Players;
