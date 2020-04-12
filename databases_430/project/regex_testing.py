import re


email = ['cdell_i-ott96@gmail.com', '12345@12345.com', 'asdfsd@gmail.com',
         '{[]}@gmail.com']

email_regex = r'\A(?=[A-Za-z0-9._-]{1,30}@[A-Za-z0-9._-]{1,30}\Z).*'

p = re.compile(email_regex)

for item in email:
    print(p.match(item))
