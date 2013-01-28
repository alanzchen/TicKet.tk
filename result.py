#-*- coding: utf-8 -*--
from django.http import HttpResponse
from django.template import Context, loader
from django.utils import simplejson
from ticket.models import PlaneDB

def result(request,source,target)
	indextemplate = loader.get_template('result.html')
	Plane = PlaneDB.object.filter(Source=source).filter(Target=target)
	ctt=Context()
	ctt['h1']='Congratulation!'
	ctt['title']='结果'
	ctt['source']=source
	ctt['target']=target
	return dajax.json()