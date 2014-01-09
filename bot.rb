#!/usr/bin/ruby
#@defined_words = {"Ninjex" => "My master"}
@mods   =   [':Ninjex!~ninjex@71-80-88-115.dhcp.kgpt.tn.charter.com']
@admin  =   ':Ninjex!~ninjex@71-80-88-115.dhcp.kgpt.tn.charter.com'
require 'socket'      # Create connections with the server
require 'nokogiri'    # Scrape data from websites
require 'open-uri'    # Open website content (for scraps)
require 'rubygems'    # Multiple fun things like text
require 'cgi'         # Validate URI's
require 'digest/md5'  # Hashing strings to MD5
require 'thread'      # Create threads for mult functions
require 'yaml'        # Convert information plain text <-> code
require 'mysql'
require_relative 'settings'   # Functions loads all the functions correctly
require_relative 'functions'  # Functions loads all the functions correctly
require_relative './MySQL/mysql_info.rb'
require_relative './files/passwords.rb'
@irc = TCPSocket.open(@server, @port)
@state = 0

def main(chan, nick, name)
  until @irc.eof? do    # Keep the bot connected
    msg = @irc.gets     # Get information from the server
    if msg == ''        # If the server hasn't recieved any data
      sleep(0.5)        # Wait for .5 seconds
    else
      puts "<-- #{msg}"             # Print the message recieved
      @input = msg.split(' ')       # Split the message into an array via spaces
      if @input[0] == 'PING'        # If we recieve a ping
        send_data 'PONG '+@input[1] # Send pong with ping data
      end
      if @state == 0      # If state is at 0 (not logged in)
        sleep(2)          # Wait for 2 seconds
        login(nick, name) # Call the login function
        @state += 1       # Add 1 to state (logged in)
      end
                                                            ############# Examples for each variable #############
      @full_user = @input[0]                                #=> array[:Ninjex!bounces@HTS-ED9DAF7A.kphservices.com]
      @user_array = @full_user.split('@')                   #=> array[:Ninjex!bounces, HTS-ED9DAF7A.kphservices.com]
      @user_name_array = @user_array[0].split('!')          #=> array[:Ninjex, bounces]
      @user_name_first = @user_name_array[0].gsub(':', '')  #=> array[Ninjex]
      @user_name_second = @user_name_array[1]               #=> array[bounces]
      @user_host = @user_array[1]                           #=> array[HTS-ED9DAF7A.kphservices.com]
      
      command = @input[3]     # command is item 3 in our input array
      @channel = @input[2]    # channel is item 2 in our input array

      word_list = @input.drop(3)
      if @user_name_first != @server and @user_name_first != 'NickServ' and @user_name_first != @nick
        word_list.each do |word| # Trying stuff for word analysis
          if word == @input[3] then word = word[1..-1] end
          word = word.gsub(/['"&\\]/,'')
          in_db = @con.query("select count(1) from words where user = '#{@user_name_first}' and word = '#{word}';").fetch_row[0]
          if in_db == '0'
            que = @con.query("INSERT INTO words (user, word, amount) VALUES ('#{@user_name_first}', '#{word}', 1)")
          else
            que = @con.query("UPDATE words SET amount = amount+1 WHERE user = '#{@user_name_first}' and word = '#{word}';")
          end
        end
      end

      threads = []                # Setting an array to store threaded commands
      if Thread.list.count <= 2   # If we do not have 2 or less threads running
        c_thread = Thread.new do  # Start a new thread
          check_command(command)  # Call our command in the thread
        end
        threads << c_thread
      else  # If this command would be thread number 3
        if @full_user != @server or @user_name_first != @nick or @user_name_first != "NickServ"  # If the user isn't the server, bot, or nickserv
          # Tell the user to slow down (May add ban feature to punish repeat offenders)
          chan_send("#{@user_name_first}, slow the fuck down before you get banned!")
        end
      end
      if @input[1] == '376'
        send_data("JOIN #{@chan}")
        sleep(1)
        #send_data("MODE #{@nick} +B")
        #sleep(1)
        #send_data("PRIVMSG NickServ :IDENTIFY #{@pass}")
      end
    end
  end
end

main(@chan, @nick, @name) # Call the main function