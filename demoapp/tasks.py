from __future__ import absolute_import

from celery import shared_task

@shared_task
def hello(greeting):
    print('Task recived: {0}'.format(greeting))
