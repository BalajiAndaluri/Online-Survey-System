import csvfile
import mysql.connector

# Connecting to MySQL
db = mysql.connector.connect(
    host="localhost",
    user="Balaji",
    password="Balaji@123",
    database="System"
)

cursor = db.cursor()

# CSV file path
DataFile = "C:\Users\andal\Documents\Data.csv"

# Table name and insert query
table_name = System.responses
insert_query = f"INSERT INTO {responses} (responseID, surveyID, userID, QuestionID, responseText) VALUES (%s, %s, %s, %s, %s)"

with open(DataFile, mode='r') as file:
    reader = csv.reader(file)
    next(reader)  # Skip the header row if it exists

    for row in reader:
        cursor.execute(insert_query, row)

# Commit changes and close the connection
db.commit()
cursor.close()
db.close()
print("Data imported successfully!")
