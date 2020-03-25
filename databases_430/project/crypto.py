# Name: Christian Elliott
# File: crypto.py
#
# this program is designed to demonstrate and test
# the functionality of python's hashlib hashing library


import hashlib
import os


print("Enter your desired password: ")
password = input()

print("generating random 16byte salt ...")
salt = os.urandom(16)
print("Your salt is: ")

print("Generating sha256 hash using password "%s" ..." % password)
hash = hashlib.



# INCOMPLETE. Implement my own simple salt generator
# and my own simple hash algo.
# However, the same premise as I was utilizing above
# applies to the general concept. 
