#! /bin/bash

# install python bcrypt for hashing
sudo apt update
sudo apt install python3-bcrypt -y

# create a python script that will prompt for password
# Python Script written below
  # import getpass
  # import bcrypt
  # password = getpass.getpass("password: ")
  # hashed_password = bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt())
  # print(hashed_password.decode())

# Generate a hashed password with the python script
# Create a web config file for prometheus
# basic_auth_users:
      admin:
# Reference the web config file in prometheus.service et voila!
