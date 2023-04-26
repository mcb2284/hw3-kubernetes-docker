# Base image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the program files to the container
COPY .. .

# Install required packages
RUN pip install -r requirements.txt

# Set environment variables
ENV MONGO_HOST localhost
ENV MONGO_PORT 27017
ENV FLASK_ENV development
ENV PORT 8000

# Expose port 5000 for the Flask application
EXPOSE 8000

# Run the Flask application
CMD ["python", "app.py"]

