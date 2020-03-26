# Name: Christian Elliott
# File: crypto.py
#
# this program is designed to demonstrate and test
# the functionality of python's hashlib hashing library

import os

print("Enter your desired password: ")
password = raw_input()
print(password)

print("generating random 16byte salt ...")
salt = os.urandom(16)
print("Your salt is: %s" % salt)

print("Password + salt = %s" % password + salt)
pre_hash = password + salt
pass_hash = hash(pre_hash)
print(pass_hash)


### HERE IS THE EXPLANATION FOR THE USER CREATION AND AUTH ###
# 1) Get username, check to make sure username doesn't exist
#    a. if it exists, throw error and ask for another
#    b. if it doesn't exist, ask for a password
# 2) check to ensure password meets complexity requirements,
#    which are...
#    "reasonably long, and use different types of characters"
#    --> regex check?
# 3) create salt using us.urandom(16)
# 4) append salt to password
# 5) hash the new password+salt combo
# 6) store username, password hash, and salt in user table as
#    a single entity.

### AUTHORIZAION OF USER LOGIN ###
# 1) get username and password from user
# 2) query should find entry where username = username input
# 3) get stored salt from query return
# 4) append stored salt to input password
# 5) hash this password + salt and check to see if that
#    equals hash associated with user record.
# 6) allow user to log in or say "username and password combo
#    does not exist"
