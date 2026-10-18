FROM python:3.13-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.13-slim
WORKDIR /app
RUN useradd --system --uid 10001 appuser && pip uninstall -y pip
COPY --from=builder /install /usr/local
COPY app.py .
USER 10001
EXPOSE 8000
CMD ["python", "app.py"]