#-*- coding: utf-8 -*-
from django.http import HttpResponse
from django.template import Context, loader
def hello(request):
	indextemplate = loader.get_template('index.html')
	ctt=Context()
	ctt['Title']='我还不知道这货叫什么怎么办'
	ctt['name']='我怎么知道'
	ctt['version']='Saber'
	ctt['home']='首页'
	ctt['dropdown']='支持'
	ctt['dp1text']='维基'
	ctt['dp2text']='开源协议'
	ctt['dp3text']='关于'
	ctt['Source']='源代码'
	ctt['step1header']='第一步:始发地'
	ctt['step2header']='第二步:目的地'
	ctt['step3header']='第三步:完成'
	ctt['step1description']='输入始发城市的中文名并选择，否则无效。'
	ctt['step2description']='输入目标城市的中文名并选择，否则无效。'
	ctt['step1input']='比如说：广州'
	ctt['step2input']='比如说：北京'
	ctt['step1start']='喵～'
	ctt['step2start']='喵喵～！'
	ctt['step3start']='喵喵喵～～～'
	ctt['ready']='点这里喵～'
	ctt['readytext']='点下面啦！'
	ctt['copyright']='Enigma Huang,Discrete Chan,Jiaxin Liao.All rights reserved.'
	return HttpResponse(indextemplate.render(ctt))