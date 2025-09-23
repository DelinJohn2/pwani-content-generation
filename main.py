from fastapi import FastAPI
from routes import routes # import your router module

app=FastAPI(
    title="content generation applicaion"

)
app.include_router(routes.router, prefix="/api", tags=["Routes"])


@app.get('/')
def root():
    return {'message':"content generation application is running"}