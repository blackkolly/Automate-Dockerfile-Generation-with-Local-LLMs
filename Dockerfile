```dockerfile
FROM python:3.11-slim-bullseye AS builder

WORKDIR /app

COPY main.py .

RUN useradd --create-home appuser

USER appuser

FROM python:3.11-slim-bullseye

WORKDIR /app

COPY --from=builder --chown=appuser:appuser /home/appuser/. /home/appuser

USER appuser

CMD ["python", "main.py"]
```
