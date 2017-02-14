# -*- coding: utf-8 -*-
"""
Scipy - lecture 1.2.2 - Basic types, Lists, Mutability fun
http://www.scipy-lectures.org/intro/language/basic_types.html

Created on Mon Feb 13 13:22:54 2017
@author: Martin Zamba
"""

#%% Numerical types
a = 4
print('a = ' + str(a) + ', type of a: ' + str(type(a)))

b = 1.2
print('b = ' + str(b) + ', type of b: ' + str(type(b)))

c = 1.2 + 2j
print('c = ' + str(c) + ', type of c: ' + str(type(c)))

d = a > 1
print('d = ' + str(d) + ', type of d: ' + str(type(d)))

# casting:
e = float(a)
print('e = ' + str(e) + ', type of e: ' + str(type(e)))

# always right division (probably using something like BigDecimal)
3 / 2
# integer division
3 // 2
# BigDecimal can hold really large numbers
222**222

#%% Containers - lists

colors = ['red', 'blue', 'green', 'black', 'white', 'violet', 'pink']
colors[0]     # first element
colors[-1]    # last element

# striding syntax: colors[start:stop:stride]
colors[5:]       #['violet', 'pink']
colors[:2]       # ['red', 'blue']
colors[1::2]     # ['blue', 'black', 'violet']

#%% Containers - mutability, genericity
# Lists are mutable objects and can be modified:
colors[0] = 'gray'
colors[:2]       # ['gray', 'blue']

# Referencing around with another variable accesses the same memory
colorsObjectReference = colors
colorsObjectReference[0] = 'magenta'
colors[0]        # 'magenta'

# obtaining deep copy:
colorsCopy = colors.copy()
colorsCopy[0] = 'yellow'
colorsCopy[0]    # 'yellow'
colors[0]        # 'magenta'

# The elements of a list may have different types:
colorsWithTuple = colors.copy()
colorsWithTuple[1] = (0 ,0 ,255)
colorsWithTuple[:3]       # ['magenta', (0, 0, 255), 'green']

# NOTE: Python lists are flexible, but ineffective. Numpy offers
# more efficient array type for storing evenly spaced data in memmory

#%% More operations on lists - sorting

# sorting. Lists are mutable
print("Before sort: " + str(colors))
colors.sort()       # sorted by natural ordering
print("After sort: " + str(colors))

#%% More operations on lists - add/remove

# append does not maintain insert order ...
colors.append('white')

# however pop will remove elements in order in which
# they have been appended. Append then seems like push()
# Internally Lists are probably tree structures ..
colors.pop()

colors = colors[:-2]

#%% More operations on lists - reverse
rcolors = colors[::-1]
rcolors.reverse()
rcolors.reverse()

colors + rcolors

#%% Asignment operator / mutability fun:

# mutable, inplace fun:
a = b = c = colors # a = b = c = ['black', 'blue', 'green', 'magenta', 'pink']
a[0] = ''          # a = b = c = ['', 'blue', 'green', 'magenta', 'pink']
b = ['-']          # a = c = ['', 'blue', 'green', 'magenta', 'pink']
                   # b = ['-']
a[:] = [1, 2]      # a = c = colors = [1, 2]







