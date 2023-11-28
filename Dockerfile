FROM python:3.8-slim

WORKDIR /app

# Set environment variables
ENV PORT=5001
ENV HOST=0.0.0.0
ENV FLASK_DEBUG=true
ENV FLASK_APP=/app/api/index.py


# Copy setup files like requirements, entrypoint, etc
COPY requirements.txt /app/requirements.txt
COPY entrypoint.sh /app/entrypoint.sh

RUN ls -la

RUN cat entrypoint.sh

# Add execution permission to entrypoint script
RUN chmod +x /app/entrypoint.sh

# Upgrade pip for the latest features and install the project's Python dependencies.
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

# Execute the app
ENTRYPOINT [ "/app/entrypoint.sh" ]