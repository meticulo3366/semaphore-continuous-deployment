bash -c './script/random > version'
docker build -t meticulo3366/semaphore-continuous-deployment:latest .
docker push meticulo3366/semaphore-continuous-deployment:latest
bash -c 'ansible-playbook deploy.yml'