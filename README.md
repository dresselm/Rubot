Rubot
=====

IRC bot coded in the Ruby language.

To do list:
1. Add an initializing script.
    This script will be responsible for download necessary gems and setting up other various features such as the MySQL database.

2. Proper identification.
    Create a function that will properly identify users based on the return status of a /whois.
    Users whom are identiied on their nick and in the mod array will be able to use mod functions.
    
3. Fix braille function.
    Trouble shoot and fix the braille encryption & decryption method found inside /functions/commands/braille.rb
    
Possible Additions:
1. MySQL Hash Lookup Table
    Create a table in MySQL as a lookup table for hash values.
    If this comes to be, we will automatically add to this table when new words are seen in IRC.
    
Getting Started:
1. First install the necessary gems (until I create the initializing script) -- sorry
    Look inside bot.rb for an idea of the gems you need.
    If you run bot.rb and get a require error, ensure that gem is installed on your machine.
    
2. Set up MySQL Neccesities
    A. Create a MySQL user, password, and database
    B. Inside the database create a table with the information inside /MySQL/db_initialize.sql
    C. Create a file in /MySQL/ named mysql_info.rb
      This file should contain a global variable for connecting to the database:
      @con = Mysql.new('host', 'user_name', 'password', 'db_name')
      
3. Ensure defined_words.yml has at least one defined word.
    If not, add this into the file and save it:
    ---
    pi: '3.14159265358979323846264338327950288419716939937510582097494459230781640628'
    
4. Passwords for (ident) function
    Create a file in /files/ named passwords.rb
    The contents inside this file will be the admin password and the moderator password and should look similar to:
    @admin_pass = 'admin_passw0rd'
    @mod_pass = 'mod_passw0rd'
    
4. Run the file bot.rb to configure a bot, change the default bot, and more.
    The program should now be running. To list all the command information type '(help)' without quotes in IRC.
