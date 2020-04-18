import pydig
import random; random.seed()

SMTP_SERVER_NAME = 'smtp.gmail.com'
SMTP_SERVERS = pydig.dig(SMTP_SERVER_NAME)
SMTP_SERVER = SMTP_SERVERS[0]
SMTP_PORT = 587

USER = "jdoe@gmail.com"
PASSWORD = "secret"

