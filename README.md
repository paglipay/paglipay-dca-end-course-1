# Course End Project: Creating a Docker Image and Deploying It on a Swarm Cluster

## Project Objective:
As a DevOps engineer in an IT firm, the objective is to create a Redis-based Docker image and deploy it on a Swarm cluster.

## Background:
The organization requires Redis for data storage and caching within a Swarm cluster. The development team requests the creation of a Redis-based Docker image using a Dockerfile and its deployment on the Swarm cluster. Additionally, it's necessary to publish this image on the organization's Docker Hub account for accessibility by other team members.

## Requirements:
- Utilize Docker CLI to create the Docker image and deploy it on the Swarm cluster.
- Publish the Docker image on Docker Hub.
- Document the step-by-step process for completion.

## Steps Involved:

1. **Set Up Docker Environment:**
   - Install Docker on your local machine if not already installed.
   - Make sure Docker Swarm is initialized on the cluster where you intend to deploy the application.

2. **Create Dockerfile:**
   - Create a `Dockerfile` specifying the instructions to build the Redis-based image.
   - This file typically includes commands to pull the Redis base image, expose necessary ports, set configurations, etc.
   - Example:
     ```
     # Dockerfile
     FROM alpine:latest
     RUN apk add --no-cache redis
     EXPOSE 6379
     CMD ["redis-server"]
     ```

3. **Build Docker Image:**
   - Navigate to the directory containing the `Dockerfile`.
   - Use the `docker build` command to build the Docker image.
   ```bash
   docker build --pull --rm -f "Dockerfile" -t paglipay/redis:latest "."
   ```

4. **Test Docker Image Locally:**
   - Run a container using the newly created image to ensure it works as expected.
   ```bash
   docker run --rm -it -p 6379:6379/tcp paglipay/redis:latest
   ```

5. **Push Image to Docker Hub:**
   - Log in to your Docker Hub account using the `docker login` command.
   ```bash
   docker login
   ```
   - Tag the built image with your Docker Hub username and repository name.
   ```bash
   docker tag paglipay/redis paglipay/redis
   ```
   - Push the tagged image to Docker Hub.
   ```bash
   docker push paglipay/redis
   ```

6. Deploy Image on Swarm Cluster Using Docker Compose:
   - Create a `docker-compose.yml` file with the following content:
   ```yaml
   version: '3.9'

   services:
     redis:
       image: paglipay/redis:latest
       deploy:
         replicas: 3 # adjust the number of replicas as needed
       ports:
         - "6379:6379"

   ```

7. **Verify Deployment:**
   - Confirm that the Redis service is running on the Swarm cluster.
   ```bash
   docker service ls
   ```
   Output:
   ```
   docker stack deploy -c docker-compose.yml redis
    Creating network redis_default
    Creating service redis_redis
    paul@ub-desk-230:~/Documents/Projects/paglipay-dca-end-course-1$ docker service ls
    ID             NAME                          MODE         REPLICAS   IMAGE                                          PORTS
    c5vvk57aysjs   redis_redis                   replicated   3/3        paglipay/redis:latest
    ```


