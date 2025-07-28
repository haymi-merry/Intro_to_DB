import mysql.connector
from mysql.conncetor import Error
from dotenv import load_dotenv
import os

load_dotenv()

def create_database():
    try:

        host= os.getenv("MYSQL_HOST")
        port= os.getenv("MYSQL_PORt")
        user= os.getenv("MYSQL_USER")
        password= os.getenv("MYSQL_PASSWORD") 

        connection = mysql.connector.connect(
            host=host,
            port=port,
            user=user,
            password=password
        )

        if connection.is_connceted():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database created successfully")
        else:
            print("Failed to connect to the database")

    except Error as e:
        print(f"Error While connceting to mSQL: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL conncetion is closed.")

if __name__ == "_main_":
    create_database()