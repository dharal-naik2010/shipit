# ShipIt

A small FastAPI app taken from laptop to production on AWS and Azure,
to practise the full DevOps toolchain: Linux, Git, Docker, CI/CD, Terraform,
Kubernetes, monitoring and Jenkins.

## Endpoints

| Method | Path | Description |
|---|---|---|
| GET | `/` | Greeting and hostname |
| GET | `/health` | Health check |
| GET | `/items/{id}` | Example with path and query parameters |
| GET | `/version` | App version and environment |

## Run locally

    python3 -m venv .venv && source .venv/bin/activate
    pip install -r requirements.txt
    uvicorn app.main:app --reload
