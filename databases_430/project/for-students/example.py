#!/usr/bin/python

import os, sys, re
import smtplib, imaplib
import glob
import email
from email.MIMEMultipart import MIMEMultipart
from email.MIMEBase import MIMEBase
from email.MIMEText import MIMEText
from email.MIMEImage import MIMEImage
from email import Encoders, encoders
import mimetypes

from mail import mail

if __name__ == "__main__":
      
   import os, sys, getopt
   attach = ['mail.py']
   to = 'jdoe@gmail.com'
   subject = 'this is a test'
   html = "<html><body><h1>hello gmail</h1></body></html>"
   
   mail(to = to,
        from_ = "yliow@ccis.edu",
        subject = subject,
        html = html,
        attach = attach,
        )
