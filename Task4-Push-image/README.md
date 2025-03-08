## 1.Login to Docker Hub
- Create a access token in the DockerHub
- Create a public repository in DockerHub
- Use below command and enter the username, access token as password.
```sh
docker login
```

## 2: Build the Docker Image
- Navigate to the directory containing your Dockerfile and run
```sh
docker build -t flask-mysql-app:v1 .
```
## 3. Push the Image to Docker Hub
- Tag the Image :
```sh
docker tag flask-mysql-app:v1 chaitan28/codefrontier:flask-mysql-app
```
- verify the tagged images :
```sh
docker images
```
- Push the Image:
```sh
docker push  chaitan28/codefrontier:flask-mysql-app
```
## 4. Verify the Image
- verify the Docker image in DockerHub with below link:
```sh
https://hub.docker.com/r/chaitan28/codefrontier/tags
```

- Build the container out of the image 
```sh
docker pull chaitan28/codefrontier:flask-mysql-app
docker run -d --name flask-app -p 8080:8080  chaitan28/codefrontier:flask-mysql-app
```