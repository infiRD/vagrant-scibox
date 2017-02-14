# -*- coding: utf-8 -*-
"""
Scipy - lecture 1.2.3 - Control Flow
http://www.scipy-lectures.org/intro/language/control_flow.html

Created on Mon Feb 14 00:19:00 2017
@author: Martin Zamba
"""

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
for i in range(4):
  print(i)

for word in ('cool', 'powerful', 'readable'):
     print('Python is %s' % word)

z = 1
while abs(z) < 100:
     z = z**2 + 1
print(z)

z = 1 + 1j
while abs(z) < 100:
  if z.imag == 0:
    break
  z = z**2 + 1

print(z)













