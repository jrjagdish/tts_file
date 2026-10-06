FROM python:3.12-slim

RUN pip install --no-cache-dir "piper-tts[http]"

WORKDIR /app

RUN python -m piper.download_voices \
    --data-dir /app/voices \
    hi_IN-priyamvada-medium

EXPOSE 10000

CMD ["python", "-m", "piper.http_server", \
     "--host", "0.0.0.0", \
     "--port", "10000", \
     "--data-dir", "/app/voices", \
     "-m", "hi_IN-priyamvada-medium"]