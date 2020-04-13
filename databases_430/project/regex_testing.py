import re
import os
import hashlib
import binascii

###################### EMAIL ###################################################
# email requirements:
# accepted chars: [A-Za-z0-9._-]
# 1-30 accepted chars. '@'. 1-30 accepted chars. 

# email = ['cdell_i-ott96@gmail.com',
#          '12345@12345.com',
#          'asdfsd@gmail.com',
#          '{[]}@gmail.com']

# note, email can be up to 61 chars following regex below
# email_regex = r'\A(?=[A-Za-z0-9._-]{1,30}@[A-Za-z0-9._-]{1,30}\Z).*'

# p = re.compile(email_regex)

# for item in email:
#     print(p.match(item))

################################################################################


#################### USERNAME ##################################################
# username requirements:
# 3-20 chars
# accepted chars: [A-Za-z0-9_-] Note: not allowing periods. 
# only contains alphanumerics, '_' and '-'

# username = ['cdelliott96',
#             'sfsalkf  sfa',
#             '12sdfsa_-23',
#             ' asdfsf']

# un_regex = r'\A(?=[A-Za-z0-9_-]{3,20}\Z).*'

# p = re.compile(un_regex)

# for item in username:
#     print(p.match(item))

################################################################################


################# PASSWORD #####################################################
# password requirements:
# >= 8 chars. >=1 capial letter. >=1 number. >=1 non-alphanumeric char.

# password = ['christian',
#             'money',
#             'sfsfsfsafasdfsok121039',
#             '  slkdfjhsalkf  ',
#             'A12345%asdf',
#             '123456789']

# pass_regex = r'^((?=[^a-z]*[a-z])(?=[^A-Z]*[A-Z])(?=[^0-9]*[0-9])(?=[^!@#$%^&*]*[!@#$%^&*])).*'

# p = re.compile(pass_regex)

# for item in password:
#     print(p.match(item))

################################################################################



##################### HASHING TESTING ##########################################
# generate a salt
# according to project pdf, salt should be unique. This means we have to check
# the DB for salt entries that match our generated salt. a collision is unlikely
# using os.urandom(n) where n = byte length of random bytes you want. #


print("Give me your password: ")
password = raw_input()

salt = os.urandom(16) ##### THIS IS SALT WE USE FOR HASHING #####

# - here, we convert the bytes of data in salt to a printable dump, using binascii.hexliy
# - when we save the salt, we will save the version made below, but we'll need to convert
# it back when we attempt to do a hash check. to do this, use
# binascii.unhexlify(hexstr) note that hexstr must contain an even num of hex digits.

print_salt = binascii.hexlify(salt) ##### THIS IS SALT WE WILL SAVE TO DB #####
print("your salt is: {0}").format(print_salt)
hex_salt = binascii.hexlify(print_salt)

# To be clear, here is the flow for making a salt and a hash for a new user:
# 1) Get the desired password from the user and validate it passes regex check.
# 2) Create a salt for the user.
#    (a) we have to save both the raw 16-byte salt and a hex version of that. So, we use
#    (b) hex_salt = binascii.hexlify(salt) to convert it to a hex string we can save
#        in our user DB
# 3) Hash the password and salt using sha256 through
#    hashlib.pbkdf2_hmac('sha256', password, salt, 10000)
#    (a) we still need to convert hash object to storable text so...
#        --> hex_hash = binascii.hexlify(dk)
#    (b) we can then store hex_hash in our DB.

# For hash validation (i.e. user is attempting to log in and has provided a username and
# a password) we must:
# 1) Querey DB for an entry matching requested username/email
#    (a) if that exists, pull the saved password hash and salt. goto 2)
#    (b) else, throw exception
# 2) Save stored hash and salt.
# 3) Use stored salt + users_attempt_password in
#    hashlib.pbkdf2_hmac('sha256', users_attempt_password, salt, 10000)
#    to produce a hash.
#    (a) convert this hash using
#    --> compare_hash = binascii.hexlify(dk)
# 4) compare compare_hash == stored_hash
#    (a) a match indicates user validation. they can log in.
#    (b) a non-match indicates invalid credentials. 


# if unhex_salt == salt:
#     print("unhexing salt worked!")
# else:
#     print("unhexing salt didn't work :( ...")


# use hash function
dk = hashlib.pbkdf2_hmac('sha256', password, salt, 10000)

print(binascii.hexlify(dk))


################################################################################
