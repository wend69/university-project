from fastapi import FastAPI
from am import router as analytics_router
from db_session import get_db_session


app = FastAPI()
url = ""

@app.get("/")
async def get_db_version():
    with get_db_session() as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT version();")
            return{"db_version": cur.fetchone()[0]}
app.include_router(analytics_router)
       
    