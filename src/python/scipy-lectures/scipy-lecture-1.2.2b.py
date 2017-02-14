# -*- coding: utf-8 -*-
"""
Scipy - lecture 1.2.2 - Strings, Dictionaries, Sets, Tuples
http://www.scipy-lectures.org/intro/language/basic_types.html

Created on Mon Feb 13 13:22:54 2017
@author: Martin Zamba
"""

#%% Strings

s1 = 'Hello, how are you?'
s2 = "Hi, what's up"
s3 = '''Hello,
       how are you'''
s4 = """Hi,
what's up?"""

# String are normal lists, however IMMUTABLE!, therefore we can:
# - reverse string
print(s1)
print(s1[::-1])      # ?uoy era woh ,olleH

# - get substrings
hello = s1[:5]       # Hello
you = s1[-4:-1]      # you
print(hello)
print(you)

(hello + ', ') * 2 + hello + ' ' + you + '!'    # 'Hello, Hello, Hello you!'

s1[::3]              # Hl wry?

hezlo = s1.replace('l', 'z', 1)  # Hezlo, how are you?
hezzo = s1.replace('l', 'z')  # Hezzo, how are you?
print(hezlo)
print(hezzo)

#%% Dictionaries - map(k,v)
tel = {'emmanuelle': 5752, 'sebastian': 5578}
tel['francis'] = 5915

print(tel['sebastian'])

print(tel.keys())      # dict_keys(['emmanuelle', 'sebastian', 'francis'])
print(tel.values())    # dict_values([5752, 5578, 5915])

#%% Tuples - immutable list
t = 12345, 54321, 'hello'
u = (0, 2)


#%% Sets - unordered, unique items
s = set(('a', 'b', 'c', 'a'))  # {'a', 'b', 'c'}
print(s)
print(s - set(('a', 'q')))




