import socket
soc=socket.socket()
host = input(str("Enter Host Address:"))
port = 8084
soc.connect((host,port))
print("Connected To Server")
incFile = input(str("Enter Incoming File Name:"))
file= open(incFile, 'wb')
incFileDat =soc.recv(1024)
file.write (incFileDat)
file.close()
print("File Recieved")
f = open(incFile, 'r')
recFileContent = f.read()
print("Recieved File Is:",recFileContent)