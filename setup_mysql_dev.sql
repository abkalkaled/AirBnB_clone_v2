import mysql.connector
from mysql.connector import Error

def create_database(cursor):
    try:
        cursor.execute("CREATE DATABASE IF NOT EXISTS hbnb_dev_db")
        print("Database hbnb_dev_db created successfully.")
    except Error as e:
        print(f"Error creating database: {e}")

def create_user(cursor):
    try:
        cursor.execute("CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost' IDENTIFIED BY 'hbnb_dev_pwd'")
        print("User hbnb_dev created successfully.")
    except Error as e:
        print(f"Error creating user: {e}")

def grant_privileges(cursor):
    try:
        cursor.execute("GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost'")
        cursor.execute("GRANT SELECT ON performance_schema.* TO 'hbnb_dev'@'localhost'")
        print("Privileges granted successfully.")
    except Error as e:
        print(f"Error granting privileges: {e}")

def main():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',  # Replace 'root' with your MySQL username
            password='your_password'  # Replace 'your_password' with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()

            create_database(cursor)
            create_user(cursor)
            grant_privileges(cursor)

            cursor.close()
            connection.close()
            print("MySQL server prepared successfully.")

    except Error as e:
        print(f"Error connecting to MySQL: {e}")


if __name__ == "__main__":
    main()

