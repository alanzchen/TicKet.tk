#-*- coding: utf-8 -*--
from django.http import HttpResponse
from django.template import Context, loader
from django.utils import simplejson
from ticket.models import Data

def result(request, source, target):
	indextemplate = loader.get_template('result.html')
	Plane = Data.objects.filter(Source=source).filter(Target=target)
	ctt=Context()
	ctt['Result']='查询'
	ctt['title']='结果'
	ctt['Resultm']='完成'
	ctt['source']=source
	ctt['target']=target
	return HttpResponse(indextemplate.render(ctt))