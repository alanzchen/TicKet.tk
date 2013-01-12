#-*- coding: utf-8 -*-
from django.http import HttpResponse
from django.template import Context, loader
def result(request,origin,target,date):
	indextemplate = loader.get_template('result.html')
	ctt=Context()
	ctt['h1']='Congratulation!'
	ctt['title']='结果'
	ctt['origin']=origin
	ctt['target']=target
	ctt['date']=date
	return HttpResponse(indextemplate.render(ctt))