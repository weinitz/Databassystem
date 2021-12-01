DROP DATABASE golf_database;
CREATE DATABASE golf_database;

use golf_database;
create table if not exists `players`
(
    `SSN`  varchar(255) NOT NULL,
    `Name` varchar(255) NOT NULL,
    `Age`  int          NOT NULL,
    PRIMARY KEY (`SSN`)
);

create table if not exists `jackets`
(
    `SSN`      varchar(255) NOT NULL,
    `Size`     int          NOT NULL,
    `Material` varchar(255) NOT NULL,
    PRIMARY KEY (`SSN`, `Material`),
    FOREIGN KEY (`SSN`) REFERENCES `players` (`SSN`) ON DELETE CASCADE
);

create table if not exists `construction`
(
    `SerialNumber` int NOT NULL AUTO_INCREMENT,
    `Hardness`     int NOT NULL,
    PRIMARY KEY (`SerialNumber`)
) AUTO_INCREMENT = 5;

create table if not exists `clubs`
(
    `SSN`          varchar(255) NOT NULL,
    `SerialNumber` int          NOT NULL,
    `Material`     varchar(255) NOT NULL,
    PRIMARY KEY (`SSN`, `SerialNumber`),
    KEY `SerialNumber` (`SerialNumber`),
    FOREIGN KEY (`SerialNumber`) REFERENCES `construction` (`SerialNumber`) ON DELETE CASCADE,
    FOREIGN KEY (`SSN`) REFERENCES `players` (`SSN`) ON DELETE CASCADE
);

create table if not exists `competition`
(
    `Name`      varchar(255) NOT NULL,
    `StartDate` datetime     NOT NULL,
    PRIMARY KEY (`Name`)
);


create table if not exists `contestants`
(
    `ID`            int          NOT NULL AUTO_INCREMENT,
    `CompetionName` varchar(255) NOT NULL,
    `PlayerSSN`     varchar(255) NOT NULL,
    PRIMARY KEY (`ID`),
    KEY `PlayerSSN` (`PlayerSSN`),
    KEY `CompetionName` (`CompetionName`),
    FOREIGN KEY (`PlayerSSN`) REFERENCES `players` (`SSN`) ON DELETE CASCADE,
    FOREIGN KEY (`CompetionName`) REFERENCES `competition` (`Name`) ON DELETE CASCADE
) AUTO_INCREMENT = 7;


-- rain: table
create table if not exists `rain`
(
    `RainType`  varchar(255) NOT NULL,
    `WindForce` double       NOT NULL,
    PRIMARY KEY (`RainType`)
);

create table if not exists `weather`
(
    `RainTime`      datetime     NOT NULL,
    `CompetionName` varchar(255) NOT NULL,
    `RainType`      varchar(255) NOT NULL,
    PRIMARY KEY (`RainTime`),
    KEY `RainType` (`RainType`),
    KEY `CompetionName` (`CompetionName`),
    FOREIGN KEY (`RainType`) REFERENCES `rain` (`RainType`) ON DELETE CASCADE,
    FOREIGN KEY (`CompetionName`) REFERENCES `competition` (`Name`) ON DELETE CASCADE
);

INSERT INTO golf_database.players (SSN, Name, Age) VALUES ('193903132397', 'Annika Persson', 82);
INSERT INTO golf_database.players (SSN, Name, Age) VALUES ('198904032380', 'Nicklas Jansson', 32);
INSERT INTO golf_database.players (SSN, Name, Age) VALUES ('199604072386', 'Johan Andersson', 25);

INSERT INTO golf_database.competition (Name, StartDate) VALUES ('Big Golf Cup Skövde', '2021-10-06 00:00:00');

INSERT INTO golf_database.contestants (ID, CompetionName, PlayerSSN) VALUES (4, 'Big Golf Cup Skövde', '199604072386');
INSERT INTO golf_database.contestants (ID, CompetionName, PlayerSSN) VALUES (5, 'Big Golf Cup Skövde', '198904032380');
INSERT INTO golf_database.contestants (ID, CompetionName, PlayerSSN) VALUES (6, 'Big Golf Cup Skövde', '193903132397');

INSERT INTO golf_database.rain (RainType, WindForce) VALUES ('Hail', 10);
INSERT INTO golf_database.weather (RainTime, CompetionName, RainType) VALUES ('2021-10-06 00:00:00', 'Big Golf Cup Skövde', 'Hail');

INSERT INTO golf_database.jackets (SSN, Size, Material) VALUES ('199604072386', 4, 'fleece');
INSERT INTO golf_database.jackets (SSN, Size, Material) VALUES ('199604072386', 4, 'goretex');

INSERT INTO golf_database.construction (SerialNumber, Hardness) VALUES (3, 10);
INSERT INTO golf_database.construction (SerialNumber, Hardness) VALUES (4, 5);

INSERT INTO golf_database.clubs (SSN, SerialNumber, Material) VALUES ('193903132397', 4, 'Wood');
INSERT INTO golf_database.clubs (SSN, SerialNumber, Material) VALUES ('198904032380', 3, 'Wood');
INSERT INTO golf_database.clubs (SSN, SerialNumber, Material) VALUES ('199604072386', 4, 'Metal');
