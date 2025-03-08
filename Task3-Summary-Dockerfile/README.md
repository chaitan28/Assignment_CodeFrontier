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
git clone https://github.com/chaitan28/Assignment_CodeFrontier.git
cd Task2-Dockerfile
```
- Create the Dockerfile: Ensure you have a Dockerfile in your project directory. 
- Dockerfile
```sh
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
```
- Create the requirements.txt File:
Ensure you have a requirements.txt file with the following content:
```sh
Flask==2.3.2
mysql-connector-python==8.1.0
python-dotenv==1.0.0
```
- Build the Docker Image: Run the following command to build the Docker image
```sh
docker build -t flask-mysql-app:v1  .
```

- Verify the Docker Image
```sh
docker images
```
## 3. Instructions to Run the Application Locally

- Log in to MySQL:
```sh
mysql -h codefrontier.mysql.database.azure.com -P 3306 -u admin123 -p
```
- Create the database and table:
```sh
-- Create the database
CREATE DATABASE IF NOT EXISTS message_db;

-- Use the database
USE message_db;

-- Create the messages table
CREATE TABLE IF NOT EXISTS messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT NOT NULL
);

-- Insert sample data
INSERT INTO messages (message) VALUES ('Hello, World!');
INSERT INTO messages (message) VALUES ('Welcome to the Flask MySQL App!');
```

- Run the Docker Container:
Run the container with the necessary environment variables:
```sh
docker run -p 8080:8080 \
  -e MYSQL_SERVER=codefrontier.mysql.database.azure.com\
  -e MYSQL_USER=myuser \
  -e MYSQL_PASSWORD=mypassword \
  -e MYSQL_DB=message_db \
  flask-app
```
- Access the Application:
Open your browser and navigate to http://localhost:8080. You should see: <br>
   Message from database: Hello, World!
