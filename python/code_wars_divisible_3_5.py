#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Apr  3 21:33:24 2020

@author: peterwilliams
"""


def solution(number):
  sum = 0
  for i in range(number):
      if i % 3 == 0 or i % 5 == 0:
          sum += i
  #print(sum)
  return sum

        
# solution(9176)