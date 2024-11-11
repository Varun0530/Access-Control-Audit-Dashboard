## Overview
The Access Control Audit Dashboard is a Power BI project that uses SQL to extract and analyze user access data. Designed to support auditing and monitoring of privileged access, the dashboard helps organizations understand trends, patterns, and potential risks associated with user access control. This project simulates a Privileged Access Management (PAM) environment, visualizing key metrics related to user roles, access events, login times, and high-risk activities.

## Project Goals:
1) Monitor Privileged Access: Track the number and types of privileged access events.
2) Analyze Access Frequency by Role: Understand which user roles have the highest frequency of access events.
3) Identify High-Risk Users: Detect users with elevated permissions who may pose security risks.
4) Trend Analysis of Login Activity: Reveal login activity peaks and anomalies.

## Key Features:
1) User Access Patterns: Visualize user access patterns and trends to enhance security monitoring.
2) Role-Based Access Control: Gain insights into access frequency by role and user permissions.
3) Audit-Ready Reporting: Generate data for internal and external audits.

## Database Schema
This project uses four primary tables to store and query user access data:

1) Users Table: Stores basic user information, including UserID, UserName, and RoleID.
2) Roles Table: Defines user roles and their associated privilege levels.
3) Permissions Table: Lists each role’s permissions, including access type and level.
4) AccessLogs Table: Logs each access event with details such as UserID, Timestamp, Action, and Status.

## Contributing
We welcome contributions to this project. If you have ideas for improvements, feel free to submit a pull request. Please ensure all new code is well-documented.

-) Fork the repository.
-) Create a feature branch: git checkout -b feature/YourFeatureName
-) Commit your changes: git commit -m 'Add some feature'
-) Push to the branch: git push origin feature/YourFeatureName
-) Open a pull request.






