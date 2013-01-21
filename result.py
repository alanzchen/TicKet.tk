#-*- coding: utf-8 -*-
from django.http import HttpResponse
from django.template import Context, loader
from django.utils import simplejson
from dajaxice.decorators import dajaxice_register

@dajaxice_register
def result(request,origin,target,date)
	dajax = Dajax()
	dajax.assign('#origin', 'value', origin)
	dajax.assign('#target', 'value', target)
	dajax.assign('#date', 'value', date)
	



	indextemplate = loader.get_template('result.html')
	ctt=Context()
	ctt['h1']='Congratulation!'
	ctt['title']='结果'
	ctt['origin']=origin
	ctt['target']=target
	ctt['date']=date
	return HttpResponse(indextemplate.render(ctt))