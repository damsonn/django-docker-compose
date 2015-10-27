from django.shortcuts import render
from django.http import HttpResponse
from demoapp.tasks import hello

def Hello(request):
    greeting = 'Hello, World!'
    hello.delay(greeting)
    return HttpResponse(greeting)
