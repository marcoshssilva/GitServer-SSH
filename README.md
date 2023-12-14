# GitServer-SSH

This container is an git remote server to store all your projects.

---
## Run container

Run container:
```
docker run -p 22:22 -v ./data:/repository -it --name gitserver-ssh marcoshssilvadev/gitserver-ssh:latest
```

Clone project from **gitserver-ssh**:
```
git clone ssh://git@localhost:22/repository/default.git
```
> Default user 'git'
> Default password 'git'


Fix ssh if recreate container or change host, port or ip:
```
ssh-keygen -f "~/.ssh/known_hosts" -R "[localhost]:2222"
```

---
## How to create repository

Use following script:
```
# Access shell container with user 'git'
docker exec -it -u git $CONTAINER_ID /bin/bash /root/scripts/create_repository.sh NAME_OF_REPO_HERE
```

---
## Include new ssh key

Use following script:
```
# Access shell container with user 'git'
docker exec -it -u git $CONTAINER_ID /bin/bash /root/scripts/add_ssh_key.sh SSH_KEY_HERE
```

---
## Change password from users

Change password from user 'git'
```
# Access shell container with 'root'
docker exec -it -u root $CONTAINER_ID /bin/bash /root/scripts/update_git_password.sh
```

Change password from user 'root'
```
# Access shell container with 'root'
docker exec -it -u root $CONTAINER_ID /bin/bash /root/scripts/update_root_password.sh
```

---
## Build project with Docker Buildx
```
docker buildx build --platform linux/amd64,linux/arm64,linux/ppc64le,linux/s390x --tag marcoshssilvadev/gitserver-ssh:latest .
```

## Build from this repository
```
git clone https://github.com/marcoshssilva/gitserver-ssh.git
cd gitserver-ssh
docker build -t marcoshssilvadev/gitserver-ssh:latest .
```
