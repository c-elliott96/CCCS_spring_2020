import os, sys
import smtplib
import email

from SMTP_config import *

class SMTP_Server:

   def __init__(self, 
                server=None,
                servers=None,
                port=None,
                user=None,
                password=None,
                verbose=False):
      if server == None and servers == None:
         servers = SMTP_SERVERS
      elif server != None:
         servers = [server]

      self.server = None
      
      AUTHREQUIRED = 1 # check
      e_ = None # for exception
      if verbose:
         pass
         #print "servers:", servers
      for server in servers:
         if verbose:
            #print "  logging in to SMTP server at", server, "...",
            sys.stdout.flush()
         try:
            self.server = s = smtplib.SMTP(server, port)
            s.set_debuglevel(0)
            s.ehlo()
            s.starttls()
            s.ehlo()
            s.login(user, password)
            if verbose:
               pass # print "done"
            break
         except Exception as e:
            if verbose:
               pass # print e
            e_ = e
      if e_ is not None: raise e_ # raise last exception

   def sendmail(self,
                from_=None,
                to=None,
                msg_str='HELLO WORLD'):
      self.server.sendmail(from_, to, msg_str)

   def __del__(self):
      if self.server is not None:
         self.server.close() # <------ DON'T FORGET
      
