# Start with the base Python container
FROM docker.io/python:3.10.12

# Install packages that are required. 
RUN pip install psutil Django==4.2.9 psycopg2

# Copy the Python code into the container
COPY mysite /mysite

# Set environment variables 
ENV PORT=8000 
ENV STUDENT_NAME="Mike"
ENV SITE_NAME="Mike's Site"
ENV SECRET_KEY="blah-blah-blah"
ENV DEBUG="1"

ENV POSTGRES_DB="mysite"
ENV POSTGRES_USER="mysiteuser"
ENV POSTGRES_PASSWORD="this-is-a-bad-password"
ENV POSTGRES_HOSTNAME="localhost"

# Set the working directory
WORKDIR /mysite 

# Default command to execute in the container
CMD python ./manage.py runserver 0.0.0.0:$PORT
