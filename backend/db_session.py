from contextlib import contextmanager
import psycopg2

@contextmanager 
def get_db_session():
    conn = None 
    try:
         conn = psycopg2.connect(
        host = '127.0.0.1',
        port = 5432,
        dbname = 'dashboard_db',
        user = 'postgres',
        password = '1234'
         )  
         yield conn 
    finally: 
         if conn is not None:
              conn.close()

                 
   
