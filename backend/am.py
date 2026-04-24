from fastapi import APIRouter, HTTPException 
from db_session import get_db_session 
from pydantic import BaseModel
from typing import List



router = APIRouter(prefix = "/analytics", tags = ["analytics"])

class AnalyticsRow(BaseModel):
    id: str
    create_at: str
    new_subscribe: int
    streams: int
    engagement_rate: float
    watch_t: int
    audience: int
    audience_satisfaction: float
    chart: str


@router.get("/latest", response_model=List[AnalyticsRow])
async def get_latest_analytics():
    rows = []
    try:
     with get_db_session() as conn:
        with conn.cursor() as cur:
            cur.execute("""SELECT id, create_at,
                         new_subscribe, streams, engagement_rate, 
                        watch_t, audience, audience_satisfaction,
                        chart FROM analytics ORDER BY create_at DESC LIMIT 1;""")
            rows = cur.fetchall()
            if not rows:
               return []
            results = []
            for row in rows:
                results.append({
                "id": row[0] if row[0] is not None else 0,
                "create_at": str(row[1]) if row[1] is not None else "",
                "new_subscribe": row[2] if row[2] is not None else 0,
                "streams": row[3] if row[3] is not None else 0,
                "engagement_rate": float(row[4]) if row[4] is not None else 0.0,
                "watch_t": row[5] if row[5] is not None else 0,
                "audience": row[6] if row[6] is not None else 0,
                "audience_satisfaction": float(row[7]) if row[7] is not None else 0.0,
                "chart": row[8] if row[8] is not None else ""
                })
        
    
            return results
    except Exception as e:
       print(f"Database error: {e}")
       raise HTTPException(status_code=500, detail=str(e))
            
             

                        
            


