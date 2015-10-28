FROM python:3.5

ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code

# this section is very important to keep a separate layer for the dependencies
RUN mkdir /code/requirements
ADD requirements.txt /code/
ADD requirements/* /code/requirements/
RUN pip install -r requirements.txt

ADD . /code/

# Docker specific config
RUN mv proj/settings/docker.py proj/settings/local.py

# build static assets
RUN SECRET_KEY=temp_value python manage.py collectstatic -v 0 --clear --noinput
