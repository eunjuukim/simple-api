from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(openapi_url=f"/openapi.json", docs_url=f"/docs")

app.add_middleware(
    CORSMiddleware,
    allow_credentials=True,
    allow_origins=["*"],
    allow_methods=["GET", "POST", "OPTIONS"],
    allow_headers=["*"],
    max_age=3600
)


@app.get("/healthy")
async def say_hello():
    return {"message": f"This api is healthy"}


@app.on_event("startup")
async def startup_event():
    print("Fast API is starting up")


@app.on_event("shutdown")
async def shutdown_event():
    print("Fast API is shutting down")
