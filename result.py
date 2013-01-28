#-*- coding: utf-8 -*--
from django.http import HttpResponse
from django.template import Context, loader
from django.utils import simplejson
from dajaxice.decorators import dajaxice_register
from ticket.models import Target
@dajaxice_register
def result(request,origin,target)
	dajax = Dajax()
	indextemplate = loader.get_template('result.html')
	dajax.assign('#origin', 'value', origin)
	dajax.assign('#target', 'value', target)
	dajax.code('loaded();')
	ctt=Context()
	ctt['h1']='Congratulation!'
	ctt['title']='结果'
	ctt['origin']=origin
	ctt['target']=target
	dajax.assign('div .page-result-inner', 'innerHTML', indextemplate.render(ctt))
	return dajax.json()