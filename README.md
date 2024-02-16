# Django Docker Compose #
A production oriented dockerized django app. explained in more details on [my blog](http://damdev.me/docker/2015/10/28/docker-compose-django.html)

## Architecture ##
This app is using what one could call a standard django app. Including the followings :
- Django running on gunicorn
- Celery worker
- Postgres database
- RabbitMQ
- Nginx frontend server

## Prerequisites ##
This required *docker*, *docker-machine* and *docker-compose* installed on your local machine. More informations on [Docker's website](https://docs.docker.com/installation/mac/)

## Running locally ##
```
# creates a local host for docker containers, only do once
docker-machine create -d virtualbox local

# create your config secrets
cp secrets.env.sample secrets.env

# load the docker env
eval "$(docker-machine env local)"

# build web image
docker-compose build

docker-compose up -d

# run commands inside the containers
docker-compose run app python manage.py migrate
```

### How can make sure it works ? ###
1. first you need to know your `local` docker machine ip, using `docker-machine ls`.
2. Visit http://LOCAL_IP
3. Check celery's worker logs `docker-compose logs worker`


### Consideration ###
*docker compose* is not deemed production ready. There are some limitations, mainly related to scalability. But I think it is fine for small applications. It is obviously much better to understand how docker compose works.
more info on [docker's website](https://docs.docker.com/compose/production/).

### Tutum ###
The big news is [tutum](https://www.tutum.co/) has been [acquired by Docker](http://blog.docker.com/2015/10/docker-acquires-tutum/). Tutum is a could service to manage and deploy Docker applications. It uses a **stack** descriptor, which is compatible with docker-compose yaml format. So you can use my example project to deploy and mange your app with tutum.
# apps
# apps
