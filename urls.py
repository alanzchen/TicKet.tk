from django.conf.urls import patterns, include, url
from ticket.index import hello
from ticket.result import result
#from dajaxice.core import dajaxice_autodiscover, dajaxice_config
#dajaxice_autodiscover()
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    #url(r'^$', 'ticket.views.home', name='home'),
    url(r'^$',hello),
    url(r'^source/(.{3})/target/(.{3})/$', result),
    # url(dajaxice_config.dajaxice_url, include('dajaxice.urls')),
    # url(r'^ticket/', include('ticket.foo.urls')), 
    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
