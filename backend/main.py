from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware 
from am import router as analytics_router
from db_session import get_db_session


app = FastAPI()
url = ""

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)



@app.get("/")
async def get_db_version():
    with get_db_session() as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT version();")
            return{"db_version": cur.fetchall()[0]}
app.include_router(analytics_router)
       
    