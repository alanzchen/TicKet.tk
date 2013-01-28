#-*- coding: utf-8 -*-
from django.http import HttpResponse
from django.template import Context, loader
def hello(request):
	indextemplate = loader.get_template('index.html')
	ctt=Context()
	ctt['title']='Welcome!'
	return HttpResponse(indextemplate.render(ctt))