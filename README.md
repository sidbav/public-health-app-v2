# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:


## Ruby version

## System dependencies

## Configuration

## Database creation

## Database initialization
Once you have the proiject opened in VS Code. Install Postgres. Then Click the PostgresSQL Elephant icon, select the myapp_development dropdown menu, select the public drop down menu, right click users, hover over "Select..." and click "Run Select Top 1000". 

## How to run the test suite

Feel free to add cucumber test cases to the cucumber test files and steps to the steps files. To run the current cucumber tests, enter the command "rails cucumber"

## Services (job queues, cache servers, search engines, etc.)
The application utilizes Google Maps' search engine to return relevant venues near the user's zipcode. 

## Deployment instructions
Deploy the rails app to heroku. 

## MailCatcher:
INSTALL mailcatcher outside of ruby instance (in other words do not add it as a gem to this project) since it will lead to conflicts with this project's gems
### MacOS Install
To install run the following command (MacOs):
```
brew install mailcatcher
```
To start mailcatcher run the following commands:
```
brew services start mailcatcher
```
To open the mailcatcher website run:
```
open http://127.0.0.1:1080
```
To stop running mailcatcher, please run the following:
```
brew services stop mailcatcher
```

### For windows, Linux, etc:
Please follow the documentation on the official [website](https://mailcatcher.me/)
