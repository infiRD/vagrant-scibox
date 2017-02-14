# -*- coding: utf-8 -*-
"""
Scipy - lecture 1.2.3 - Control Flow
http://www.scipy-lectures.org/intro/language/control_flow.html

Created on Mon Feb 14 00:19:00 2017
@author: Martin Zamba
"""
import matplotlib.pyplot as mp
import numpy as np

#%% if/then/else

if 2**2 == 4:
  print("Obviously!")

a = 2**10
if a == 1:
    print(1)
elif a == 2:
    print(2)
else:
    if a > 1000:
        if a < 2000:
            print('A LOT!')
        else:
            print('A hell of a LOT!')
    else:
        print('A lot')


#%% Loops
# for loop:
for i in range(4):
    print(i)

# iterator:
for word in ('cool', 'powerful', 'readable'):
    print('Python is %s' % word)

# while:
z = 1
while abs(z) < 100:
    z = z**2 + 1
print(z)

# break:
z = 1 + 1j
while abs(z) < 100:
    if z.imag == 0:
        break
    z = z**2 + 1
print(z)

# continue:
a = [1, 0, 2, 4]
for element in a:
    if element == 0:
        continue
    print(1. / element)

#%% Conditional expressions:
a = ['red', 'green', 'black']
b = ['red', 'green', 'black']
c = a
d = []

print(a is b)  # reference comparison - false
print(a == b)  # content comparison - true
print(a == d)  # false
print(a is c)  # true

# mutability fun:
print(b == c)  # true
a[0] = 'brown'
print(b == c)  # false

# contains:
print('pink' in c)    # false
print('brown' in c)   # true

#%% Advanced interators:
vowels = 'aeiouy'

msg = "Hello how are you?"
msgVowels = []
for c in msg:
    if c in vowels:
        msgVowels.append(c)
print(msgVowels)  # ['e', 'o', 'o', 'a', 'e', 'y', 'o', 'u']

for w in msg.split():
    print(w)

for w in "Hello how are you?".split(): print(w)

# iterating with index
words = msg.split()
for i in range(0, len(words)): print((i, words[i]))


# iterating over list with enumerate function
print()
for index, item in enumerate(words):
    print((index, item))

# iterating over dictionary:
print()
d = {'a': 1, 'b':1.2, 'c':1j}
for key, val in sorted(d.items()):
    print('Key: %s has value: %s' % (key, val))

# list conprehension:
list = [i**2 for i in range(4)]

#%% ============================  EXCERCISE  =============================
# Compute the decimals of Pi using the Wallis formula:
# ------------------------------------------------------------------------

xs = []
ys = []
n = 10000
acc = 1
i = 1
while i <= n:
    acc = acc * 4*i**2 / (4*i**2-1)
    i = i + 1
    xs.append(i)
    ys.append(acc)

pi = 2 * acc
print("Pi = " + str(pi))

mp.close()
mp.semilogx(xs, [y*2 for y in ys])


