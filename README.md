# Django Docker Compose #
A production oriented dockerized django app. explained in more details on [my blog](http://damdev.me/docker/2015/10/12/django-docker)

## Architecture ##
This app is using what one could call a standard django app. Including the followings :
- Django running on gunicorn
- Celery worker
- Postgres database
- RabbitMQ
- Nginx frontend server

### Prerequisites ###
This required *docker*, *docker-machine* and *docker-compose* installed on your local machine. More informations on [Docker's website](https://docs.docker.com/installation/mac/)

### Running locally
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
```

## Consideration ##
*docker-compose* is not deemed production ready. There are some limitations, but as long as you knew them I think it is fine. It is obviously much better to understand how docker-compose works.
more info on [docker's website](https://docs.docker.com/compose/production/)

## Credits
