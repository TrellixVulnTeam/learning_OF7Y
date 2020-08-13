#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon May  4 16:50:19 2020

@author: petercw94
"""
# Trolls are attacking your comment section!
# A common way to deal with this situation is to remove all 
# of the vowels from the trolls' comments, neutralizing the threat.

#Your task is to write a function that takes a string and 
# return a new string with all vowels removed.

# For example, the string "This website is for losers LOL!" would 
# become "Ths wbst s fr lsrs LL!".

# Note: for this kata y isn't considered a vowel.

def disemvowel(string):
    vowels = ['a', 'e', 'i', 'o', 'u']
    for i in vowels:
        string = string.replace(i, '')
    return string

string = 'This website is for losers LOL!'
disemvowel(string)
    