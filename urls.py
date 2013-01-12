from django.conf.urls import patterns, include, url
from ticket.index import hello
from ticket.result import result
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    #url(r'^$', 'ticket.views.home', name='home'),
    url(r'^$',hello),
    url(r'^origin/(\d{1,2})/target/(\d{1,2})/date/(\d{1,2})/$', result),
    # url(r'^ticket/', include('ticket.foo.urls')), 
    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
