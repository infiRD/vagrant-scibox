# -*- coding: utf-8 -*-
"""
String interpolation experiments

Created on Mon Feb 13 13:22:54 2017
@author: Martin Zamba
"""

#%% String interpolation
# see:
# [Variable interpolation in Python]
#    (http://stackoverflow.com/questions/3542714/variable-interpolation-in-python)
# [Is there a Python equivalent to Ruby's string interpolation?]
#    (http://stackoverflow.com/questions/4450592/is-there-a-python-equivalent-to-rubys-string-interpolation)
# [Python string formatting: % vs. .format]
#    (http://stackoverflow.com/questions/5082452/python-string-formatting-vs-format)

fruit = 'Pear';
print("Hey, {fruit}!".format(**locals()))
print("Hey, %s!" % fruit)
print("Hey, %(fruit)s!" % locals())
print("Hey, {0}!".format(fruit))

# in python 3.6+
print(f"Hey, {fruit}!")

tu = (12,45,22222,103,6)
print('{0} {2} {1} {2} {3} {2} {4} {2}'.format(*tu))














