#-*- coding: utf-8 -*-
from django.http import HttpResponse
from django.template import Context, loader
def hello(request):
	indextemplate = loader.get_template('index.html')
	ctt=Context()
	ctt['h1']= '欢迎'
	ctt['title']='Welcome!'
	return HttpResponse(indextemplate.render(ctt))
#		content_type="application/xhtml+xml")