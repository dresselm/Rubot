Rubot
=====
<br>
IRC bot coded in the Ruby language.<br>

To do list:<br>
1. Add an initializing script.<br>
&emsp; This script will be responsible for download necessary gems and setting up other various features such as the MySQL database.<br>
<br>
2. Proper identification.<br>
&emsp; Create a function that will properly identify users based on the return status of a /whois.<br>
&emsp; Users whom are identiied on their nick and in the mod array will be able to use mod functions.<br>
<br>
3. Fix braille function.<br>
&emsp; Trouble shoot and fix the braille encryption & decryption method found inside /functions/commands/braille.rb<br>
<br>
-
Possible Additions:<br>
1. MySQL Hash Lookup Table<br>
2. Create a table in MySQL as a lookup table for hash values.<br>
&emsp; If this comes to be, we will automatically add to this table when new words are seen in IRC.<br>
<br>
Getting Started:<br>
1. First install the necessary gems (until I create the initializing script) -- sorry<br>
&emsp; Look inside bot.rb for an idea of the gems you need.<br>
&emsp; If you run bot.rb and get a require error, ensure that gem is installed on your machine.<br>
<br>
2. Set up MySQL Neccesities<br>
&emsp; A. Create a MySQL user, password, and database<br>
&emsp; B. Inside the database create a table with the information inside /MySQL/db_initialize.sql<br>
&emsp; C. Create a file in /MySQL/ named mysql_info.rb<br>
&emsp;&emsp; This file should contain a global variable for connecting to the database:<br>
&emsp;&emsp; ``@con = Mysql.new('host', 'user_name', 'password', 'db_name')``<br>
<br>
3. Ensure defined_words.yml has at least one defined word.<br>
&emsp; If not, add this into the file and save it:<br>
&emsp; ```---```<br>
&emsp; ```pi: '3.14159265358979323846264338327950288419716939937510582097494459230781640628'```<br>
<br>
4. Passwords for (ident) function<br>
&emsp; Create a file in /files/ named passwords.rb<br>
&emsp; The contents inside this file will be the admin password and the moderator password and should look similar to:<br>
&emsp; ``@admin_pass = 'admin_passw0rd'``<br>
&emsp; ``@mod_pass = 'mod_passw0rd'``<br>
<br>
5. Run the file bot.rb to configure a bot, change the default bot, and more.<br>
&emsp; The program should now be running. To list all the command information type '(help)' without quotes in IRC.<br>
