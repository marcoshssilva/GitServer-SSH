# Basic-SSH-Git-Server

This container is an git remote server to store all your projects.

---
## Run container and Clone project

Build container:
```
docker build -t basic-ssh-git-server:latest .
```

Run container:
```
docker run -p 2222:22 -v ./data:/repository -it --name git-remote-server basic-ssh-git-server:latest
```

Clone project:
```
git clone ssh://git@localhost:2222/repository/default.git
```
> Default user 'git'
> Default password 'git'


Fix ssh if recreate container or change host, port or ip:
```
ssh-keygen -f "~/.ssh/known_hosts" -R "[localhost]:2222"
```

---
## How to create repository

Run following commands as example:
```
# Access shell container with user 'git'
docker exec -it -u git $CONTAINER_ID /bin/bash

# Create project
mkdir /repository/$PROJECT_NAME.git

# Initialize project as remote
cd /repository/$PROJECT_NAME.git
git init --bare
```
> $CONTAINER_ID is id referenced on your container
> $PROJECT_NAME is name of project when you make clone

---
## Change password from user 'git'

Run following commands as example:
```
# Access shell container with 'root'
docker exec -it -u root $CONTAINER_ID /bin/bash

# Change password from 'git' user
echo 'git:$NEW_PASSWORD' | chpasswd
```
> #NEW_PASSWORD is new password to user, after run this password will encrypted
