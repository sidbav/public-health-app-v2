# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:


## Ruby version

## System dependencies

## Configuration

## Database creation

## Database initialization

## How to run the test suite

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

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
