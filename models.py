from django.db import models

class Data(models.Model):
    Source = models.CharField(max_length=3)
    Target = models.CharField(max_length=3)
    Directfly = models.CharField(max_length=255)
    Cost = models.IntegerField()
    MoneySaved = models.IntegerField()
    PlaneNum = models.IntegerField()
    Plane1 = models.CharField(max_length=255)
    Plane2 = models.CharField(max_length=255)
    Plane3 = models.CharField(max_length=255)
    Plane4 = models.CharField(max_length=255)
    Plane5 = models.CharField(max_length=255)
    Plane6 = models.CharField(max_length=255)
    Plane7 = models.CharField(max_length=255)
    Plane8 = models.CharField(max_length=255)
    Plane9 = models.CharField(max_length=255)
    Plane10 = models.CharField(max_length=255)