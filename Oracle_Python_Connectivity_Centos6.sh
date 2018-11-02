#install cx_Oracle on CentOS 6

#cx_Oracle is a Python extension module that allows access to Oracle databases and conforms to the Python database API specification. The cx_Oracle module must be imported as it's not part of the core Python language. 

#Lets start the installation 

yum install libaio

#1. Download and install oracle client from Oracle
Link: http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html
Accept License Agreement 
 
rpm -Uvh oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
rpm -Uvh oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

rpm -Uvh oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm (no need of this)

#2. Add Oracle client to library path
echo "/usr/lib/oracle/12.1/client64/lib" >/etc/ld.so.conf.d/oracle.conf
ldconfig

#3. install epel repo via yum extra
#EPEL (Extra Packages for Enterprise Linux)
yum install epel-release

#4. Install additional
yum install gcc python-pip.noarch python-devel

#5. Install cx_Oracle via pip
pip install cx_Oracle


#Connecting to Oracle
#To create a connection to Oracle, perform the following steps:

#Review the code as follows, which is contained in the connect.py file in the $HOME directory.
import cx_Oracle
con = cx_Oracle.connect('pythonhol/welcome@127.0.0.1/orcl')
print con.version
con.close()
#where orcl is service name

#Key Points:
Note: ORA-12514: TNS:listener does not currently know of service requested in connect descriptor
Solution: you are giving wrong servive name i.e in this case it is orcl

service name is present in tnsnames.ora
ORCL =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = <hostname as /etc/hosts>)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = orcl)
    )
      )

tnsnames.ora file is present in $ORACLE_HOME/network/admin
U can just give cd $ORACLE_HOME/network/admin  
You will find tnsnames.ora

still you have problem to find tnsnames.ora .. run the following command
export TNS_ADMIN =$ORACLE_HOME/network/admin

listner.ora file is like this
LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = TCP)(HOST = <hostname as /etc/hosts>)(PORT = 1521))
      (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521))
    )
  )





