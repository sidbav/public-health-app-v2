# README

Our application, Public Health App, is a dynamic, user-centric health management tool designed to empower patients in managing their health.

Upon registration, users enter key information, enabling a tailored health journey.Once logged in, patients gain access to a variety of health surveys. These assessments are designed to gauge different aspects of one's health, identifying potential areas of concern and providing personalized insights.Based on survey outcomes, Public Health App directs users to nearby health resources.

While it currently offers food insecurity surveys, its design allows for future integration of diverse surveys addressing various aspects such as mental wellness, and employment etc, all available in multiple languages.As we continue to enhance the app and gather more user data, we aim to offer even more tailored health recommendations and resources. 


## Prerequisites

Ensure you have the following installed on your local development machine:

- Ensure that Ruby >= 3.0.0 is installed.You may find the Ruby documentation helpful to have on hand. [Ruby Documentation](https://ruby-doc.org/)
- Make sure the ruby version at the top of Gemfile matches your local ruby version (e.g. if you have ruby 3.1.2, your Gemfile should have ruby "3.1.2 at the top.Run ruby -v in the terminal to check the version you are using. In the Gemfile, verify that ruby '<version>' below source 'https://rubygems.org' is correct

- Check your Rails version. If no rails, run gem install rails.
- Check your Bundler version. If bundle -v fails, run gem install bundler to install it. 
- Verify the Heroku command line tool has been installed in the development environment. [Heroku CLI Documentation](https://devcenter.heroku.com/articles/heroku-cli#install-with-ubuntu-debian-apt-get)
- PostgreSQL: The default Rails development environment expects to use the SQLite3 database. For shifting to PostgreSQL for development, follow the instructions in this [guide](https://github.com/sidbav/public-health-app-v2/wiki/Shifting-to-PostgreSQL-for-development).


## Installing

Clone the repository:
`git clone https://github.com/sidbav/public-health-app-v2.git`

Install the dependencies:
bundle install

Verify you have Ruby, Rails, and Heroku CLI installed:
ruby -v &&\
rails -v &&\
bundle -v &&\
heroku -v &&\

### Setup the database:
`rails db:create`
`rails db:migrate`


### To seed the database, run:
`rails db:seed`

### Running the Application
You can start the rails server using the command given below.
`rails s`

### Change the database for production
- All apps on Heroku use the PostgreSQL database. For Ruby/Rails apps to do so, they must include the pg gem.To specify production-specific gems, add `gem 'pg'`  for Heroku deployment
- To make sure sqlite3 gem is only loaded in development and test environments but not production.
 make sure  `gem 'sqlite3'` is added for development

- Always Run bundle install to update dependencies after you modify gemfile

If you encounter an error, run `bundle config set --local without 'production'` and then `bundle install` again.Commit the updated Gemfile and Gemfile.lock.

Note: Heroku ignores config/database.yml and enforces the use of PostgreSQL. Modifying the production: section in database.yml will not affect Heroku's behavior.

You may find `PostgreSQL Explorer` VS code extension useful 

## How to run the test suite

 1. Before running the tests, make sure you have the required gems installed. Run `bundle install`.
 2. Cucumber is used for testing the application using BDD.  We have defined 31 scenarios to simulate user interactions with the app.To run Cucumber tests `bundle exec cucumber`
 3. RSpec is used for TDD in our application.We have 18 RSpec tests covering various aspects of the app. Run `bundle exec rspec`
 ### Code Coverage with SimpleCov
 SimpleCov is used for code coverage. To generate a coverage report, add SimpleCov to your test helper file:
  `require 'simplecov'`
  `SimpleCov.start`
 After running tests, view the coverage report by opening coverage/index.html in your browser.

## Heroku Deployment Instructions

1. Authenticate with Heroku CLI:
   - Run `heroku login` and follow the prompts.
   - For terminal without a browser, follow [these steps](https://devcenter.heroku.com/articles/authentication#logging-in-without-a-browser).

2. Navigate to your app's root directory.

3. Create a new app "container" on Heroku using `heroku create healthapp`.

4. Verify the association by running `git remote show heroku`.

5. Deploy your app using `git push heroku main`.

6. Create a `Procfile` (without file extension) in your app's root directory with the following content: web: bundle exec rails server -p $PORT
   
   Commit the changes and push to Heroku again.

7. Access your app at `https://healthapp.herokuapp.com`.

You can find more information on our [wiki page](https://github.com/sidbav/public-health-app-v2/wiki/Heroku-App-Deployment)



## Services (job queues, cache servers, search engines, etc.)
The application utilizes Google Maps' search engine to return relevant venues near the user's zipcode.

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
