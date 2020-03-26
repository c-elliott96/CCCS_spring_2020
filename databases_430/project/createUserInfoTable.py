import MySQLdb

# =====================
# Create UserInfo table
# =====================

createUserInfo = '''
Create table IF NOT EXISTS UserInfo (
uid INT AUTO_INCREMENT NOT NULL,
username VARCHAR (100) UNIQUE NOT NULL,
primary key (uid)
) engine = innodb;
'''

# ==================
# Create Users table
# ==================

createUsers = '''
Create table IF NOT EXISTS Users (
uid INT,
pass_hash VARCHAR (50) UNIQUE NOT NULL,
salt VARCHAR (20) NOT NULL,
FOREIGN KEY (uid) 
REFERENCES UserInfo(uid)
ON UPDATE CASCADE
) engine = innodb;
'''

db = MySQLdb.connect(
    host='magicmealmaker.mysql.pythonanywhere-services.com',
    user='magicmealmaker',
    passwd='V@s22BG12',
    db='magicmealmaker$Project')
cursor = db.cursor()
cursor.execute(createUserInfo)
db.commit()

cursor.execute(createUsers)
db.commit()
cursor.close()
db.close()
