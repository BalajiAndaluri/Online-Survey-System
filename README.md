# Online-Survey-System - _A beginner Friendly MySQL Excercise._
---
This academic survey aims to gather insights into various facets of a Computer Science Engineering student's journey towards becoming a proficient software engineer. 
The questionnaire was structured around three primary areas: 
- Experiences with LeetCode coding challenges
- Preferences for programming languages, and
- Individual productivity habits.
---

The Google Form collected responses from participants, including their name and email, across 10 distinct questions.To manage the structured data, I designed several relational tables, as detailed in the accompanying Enhanced Entity-Relationship (EER) diagram (EER_Diagram.png).  
  
All dynamic data, encompassing user submissions and participant details, was initially compiled into separate comma-separated values (CSV) files, specifically `Data.csv` for responses and `Users.csv` for user information. A Python script, leveraging the `csv`, `mysql.connector`, and `pandas` libraries, was developed to efficiently import this raw CSV data and persist it into the corresponding MySQL database tables.  

---
Learning Objectives

  - Gain hands-on experience with SQL queries.
  - Understand how to create and populate database tables.
  - Learn how to import data from CSV files.
  - Explore the use of ER diagrams to visualize database relationships.

Additional Notes

  - This project is a simplified version of a real-world scenario.
  - You can expand on this project by adding more tables, data, and complex queries.
