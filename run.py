import paramiko 

host="hostname"
user="username"

client = paramiko.SSHClient()
client.set_missing_host_key_policy(
    paramiko.AutoAddPolicy())

client.connect("192.168.50.11", username="vagrant",password='vagrant')

stdin, stdout, stderr = client.exec_command('echo "hello"')

print "stderr: ", stderr.readlines()
print "pwd: ", stdout.readlines()
