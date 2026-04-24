from fastapi import APIRouter, HTTPException 
from db_session import get_db_session 
from pydantic import BaseMdel
from typing import List


router = APIRouter(prefix = "/analytics", tags = ["analytics"])

@router.get("/latest")
async def get_latest_analytics():
    with get_db_session() as conn:
        with conn.cursor() as cur:
            cur.execute("""SELECT id, 
                        create_at,
                         new_subscribe, streams, engagement_rate, 
                        watch_t, audience, audience_satisfaction,
                        chart FROM analytics ORDER BY create_at DESC LIMIT 1;""")
            row = cur.fetchone()
            if not row: 
                raise HTTPException(status_code = 404, detail = "No analytics data found.")
            return {
                "id": row[0],
                "create_at": row[1],
                "new_subscribe": row[2],
                "streams": row[3],
                "engagement_rate": row[4],
                "watch_t": row[5],
                "audience": row[6],
                "audience_satisfaction": row[7],
                "chart": row[8]
            }
            
             

                        
            


