create database client;
use client;
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100),
    RoleID INT
);

CREATE TABLE Roles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50),
    PrivilegeLevel VARCHAR(20)
);

CREATE TABLE Permissions (
    PermissionID INT PRIMARY KEY,
    RoleID INT,
    PermissionType VARCHAR(50),
    AccessLevel VARCHAR(20)
);

CREATE TABLE AccessLogs (
    LogID INT PRIMARY KEY,
    UserID INT,
    Timestamp DATETIME,
    Action VARCHAR(100),
    Status VARCHAR(10) 
);
INSERT INTO Users (UserID, UserName, RoleID) VALUES
(1, 'Alice', 1), (2, 'Bob', 2), (3, 'Carol', 3), (4, 'David', 1), (5, 'Eve', 2),
(6, 'Frank', 3), (7, 'Grace', 1), (8, 'Hank', 2), (9, 'Ivy', 3), (10, 'Jack', 1),
(11, 'Kate', 2), (12, 'Leo', 3), (13, 'Mona', 1), (14, 'Nick', 2), (15, 'Olivia', 3),
(16, 'Paul', 1), (17, 'Quinn', 2), (18, 'Ray', 3), (19, 'Sophia', 1), (20, 'Tom', 2),
(21, 'Uma', 3), (22, 'Vera', 1), (23, 'Will', 2), (24, 'Xander', 3), (25, 'Yara', 1),
(26, 'Zane', 2), (27, 'Ana', 3), (28, 'Ben', 1), (29, 'Clara', 2), (30, 'Dan', 3);
INSERT INTO Roles (RoleID, RoleName, PrivilegeLevel) VALUES
(1, 'Admin', 'High'), 
(2, 'User', 'Low'), 
(3, 'Auditor', 'Medium');
INSERT INTO Permissions (PermissionID, RoleID, PermissionType, AccessLevel) VALUES
(1, 1, 'Read', 'High'), (2, 1, 'Write', 'High'), (3, 1, 'Delete', 'High'),
(4, 2, 'Read', 'Low'), (5, 2, 'Write', 'Low'), (6, 2, 'Execute', 'Low'),
(7, 3, 'Read', 'Medium'), (8, 3, 'Write', 'Medium'), (9, 3, 'Audit', 'Medium');
INSERT INTO AccessLogs (LogID, UserID, Timestamp, Action, Status) VALUES
(1, 1, '2024-01-01 09:00', 'Login', 'Success'), (2, 2, '2024-01-01 09:05', 'Login', 'Success'),
(3, 3, '2024-01-01 09:10', 'Write', 'Success'), (4, 4, '2024-01-01 09:15', 'Delete', 'Success'),
(5, 5, '2024-01-01 09:20', 'Read', 'Success'), (6, 6, '2024-01-01 09:25', 'Login', 'Failure'),
(7, 7, '2024-01-01 09:30', 'Audit', 'Success'), (8, 8, '2024-01-01 09:35', 'Write', 'Failure'),
(9, 9, '2024-01-01 09:40', 'Login', 'Success'), (10, 10, '2024-01-01 09:45', 'Execute', 'Failure'),
(11, 11, '2024-01-01 09:50', 'Login', 'Success'), (12, 12, '2024-01-01 09:55', 'Write', 'Success'),
(13, 13, '2024-01-01 10:00', 'Delete', 'Success'), (14, 14, '2024-01-01 10:05', 'Read', 'Failure'),
(15, 15, '2024-01-01 10:10', 'Login', 'Success'), (16, 16, '2024-01-01 10:15', 'Audit', 'Success'),
(17, 17, '2024-01-01 10:20', 'Login', 'Failure'), (18, 18, '2024-01-01 10:25', 'Write', 'Success'),
(19, 19, '2024-01-01 10:30', 'Read', 'Success'), (20, 20, '2024-01-01 10:35', 'Delete', 'Success'),
(21, 21, '2024-01-01 10:40', 'Login', 'Success'), (22, 22, '2024-01-01 10:45', 'Write', 'Success'),
(23, 23, '2024-01-01 10:50', 'Audit', 'Failure'), (24, 24, '2024-01-01 10:55', 'Login', 'Success'),
(25, 25, '2024-01-01 11:00', 'Execute', 'Failure'), (26, 26, '2024-01-01 11:05', 'Read', 'Success'),
(27, 27, '2024-01-01 11:10', 'Login', 'Success'), (28, 28, '2024-01-01 11:15', 'Write', 'Success'),
(29, 29, '2024-01-01 11:20', 'Delete', 'Success'), (30, 30, '2024-01-01 11:25', 'Read', 'Failure');

SELECT u.UserName, r.RoleName, a.Action, a.Timestamp
FROM AccessLogs a
JOIN Users u ON a.UserID = u.UserID
JOIN Roles r ON u.RoleID = r.RoleID
WHERE r.PrivilegeLevel = 'High';

SELECT r.RoleName, COUNT(a.LogID) AS AccessCount
FROM AccessLogs a
JOIN Users u ON a.UserID = u.UserID
JOIN Roles r ON u.RoleID = r.RoleID
GROUP BY r.RoleName;

SELECT DATEPART(HOUR, Timestamp) AS Hour, COUNT(LogID) AS LoginCount
FROM AccessLogs
WHERE Action = 'Login' AND Status = 'Success'
GROUP BY DATEPART(HOUR, Timestamp)
ORDER BY Hour;

SELECT u.UserName, COUNT(p.PermissionID) AS HighAccessCount
FROM Users u
JOIN Permissions p ON u.RoleID = p.RoleID
WHERE p.AccessLevel = 'High'
GROUP BY u.UserName
HAVING COUNT(p.PermissionID) > 1;

