## 1: Necessary Packages Needed

- Install Docker by following the official guide: Install Docker.
- Verify the installation:
- Download the Docker Desktop :https://www.docker.com/get-started/
- Download and install the necessary packages in local PC ssuch as :python, git, mysql-connector-python 
```sh
docker --version
python --version
git --version
```
## 2. Creation of Dockerfile

- Copy the repository to the local from the remote repository
```sh
git clone 
```
Create the Dockerfile:
Ensure you have a Dockerfile in your project directory. Here’s an example:

Dockerfile
Copy
# Use a lightweight Python base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 8080 for the Flask application
EXPOSE 8080

# Run the application
CMD ["python3", "app.py"]
Create the requirements.txt File:
Ensure you have a requirements.txt file with the following content:

plaintext
Copy
Flask==2.3.2
mysql-connector-python==8.1.0
python-dotenv==1.0.0
Build the Docker Image:
Run the following command to build the Docker image:

bash
Copy
docker build -t flask-mysql-app .
-t flask-mysql-app: Tags the image with the name flask-mysql-app.

.: Specifies the current directory as the build context.

Verify the Docker Image:
Check that the image was built successfully:

bash
Copy
docker images
You should see flask-mysql-app in the list.

Instructions to Run the Application Locally
Set Up the MySQL Database:

Log in to MySQL:

bash
Copy
mysql -u root -p
Create the database and table:

sql
Copy
CREATE DATABASE message_db;
USE message_db;

CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT NOT NULL
);

INSERT INTO messages (message) VALUES ('Hello, World!');
Run the Docker Container:
Run the container with the necessary environment variables:

bash
Copy
docker run -p 8080:8080 \
  -e MYSQL_SERVER=localhost \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=your_mysql_password \
  -e MYSQL_DB=message_db \
  flask-mysql-app
Replace your_mysql_password with your MySQL root password.

Access the Application:
Open your browser and navigate to http://localhost:8080. You should see:

Copy
Message from database: Hello, World!
Prerequisites for Running the Application
Docker:

Ensure Docker is installed and running.

MySQL Server:

Ensure MySQL is installed and running.

Create the message_db database and messages table (see above).

Environment Variables:

Ensure the correct environment variables are passed to the Docker container:

MYSQL_SERVER: MySQL server host (e.g., localhost).

MYSQL_USER: MySQL username (e.g., root).

MYSQL_PASSWORD: MySQL password.

MYSQL_DB: MySQL database name (e.g., message_db).

Network Configuration:

If MySQL is running on your local machine, ensure the Docker container can access it. Use host.docker.internal as the MYSQL_SERVER on macOS/Windows:

bash
Copy
docker run -p 8080:8080 \
  -e MYSQL_SERVER=host.docker.internal \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=your_mysql_password \
  -e MYSQL_DB=message_db \
  flask-mysql-app
Summary
Prerequisites: Docker, MySQL, and environment variables.

Build the Docker Image: Use docker build -t flask-mysql-app ..

Run the Application: Use docker run with the appropriate environment variables.

Access the Application: Open http://localhost:8080 in your browser.