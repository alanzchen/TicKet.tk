#-*- coding: utf-8 -*--
from django.http import HttpResponse
from django.template import Context, loader
from django.utils import simplejson
from ticket.models import Data
from django.core.context_processors import csrf
from django.shortcuts import render_to_response
from django.db.models import Q

def result(request, source, target):
	Planes = Data.objects.filter(Source=source,Target=target)
	d = dict(Planes=Planes, target=target, source=source)
	return render_to_response("result.html", d)