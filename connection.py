import csv
import mysql.connector
import pandas as pd #For robust CSV handling

#Configuration
DB_CONFIG = {
    "host": "Localhost",
    "user": "Balaji",
    "password": "Balaji@123",
    "database": "Systems"
}

#Here, connection.py, Data.csv, and Users.csv are present  under same directory.
#So, I need not usse the path exactly.

DATA_FILE_PATH = "Data.csv" 
USER_FILE_PATH="Users.csv"

Responses_Table = "responses" # Enclose table name in quotes if it's not a direct variable
Users_Table="users"
# Make sure column names match your database schema
# The number of %s must match the number of columns in your CSV and database table

Data_Insert = f"INSERT INTO {Responses_Table} (responseID, surveyID, userID, QuestionID, responseText) VALUES (%s, %s, %s, %s, %s)"

Users_Insert = f"INSERT INTO {Users_Table} (UserID, UserName, Email) VALUES (%s, %s, %s)"

#Database Connection and Data Importing.
db = None #For proper error handling
try:
    # Connecting to MySQL
    db = mysql.connector.connect(**DB_CONFIG) #Dictionary unpacking, passing values as parameters to connect()
    cursor = db.cursor()
    cursor_users=db.cursor()

    # Using pandas to read the CSV
    df = pd.read_csv(DATA_FILE_PATH)
    df_users=pd.read_csv(USER_FILE_PATH)

    # Iterating over Data.csv file rows and inserting into database
    for index, row in df.iterrows():
        # Converts row to a tuple for cursor.execute
        data_tuple = tuple(row)
        cursor.execute(Data_Insert, data_tuple)

    db.commit()
    print(" Responses Data imported successfully!")

    # This is for Users.csv file to write data to database
    for index, row in df1.iterrows():
        data_tuple = tuple(row)
        cursor.execute(Users_Insert, data_tuple)
    db.commit()
    print(" User Data imported successfully!")

except FileNotFoundError:
    print(f"Error: The file '{DATA_FILE_PATH}' was not found. Please check the path.")
except FileNotFoundError:
    print(f"Error: The file '{USER_FILE_PATH}' was not found. Please check the path.")
except mysql.connector.Error as err:
    print(f"Database error: {err}")
    if db:#when error, roll back changes.
        db.rollback()
except Exception as e:
    print(f"An unexpected error occurred: {e}") #all other exceptions
finally:
    # Ensuring all connections are closed.
    if 'cursor' in locals() and cursor:
        cursor.close()
    if db and db.is_connected():
        db.close()
    print("MySQL connection closed.")
