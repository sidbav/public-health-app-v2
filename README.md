# README

Our application, Public Health App, is a dynamic, user-centric health management tool designed to empower patients in managing their health.

Upon registration, users enter key information, enabling a tailored health journey.Once logged in, patients gain access to a variety of health surveys. These assessments are designed to gauge different aspects of one's health, identifying potential areas of concern and providing personalized insights.Based on survey outcomes, Public Health App directs users to nearby health resources.

While it currently offers food insecurity surveys, its design allows for future integration of diverse surveys addressing various aspects such as mental wellness, and employment etc, all available in multiple languages.As we continue to enhance the app and gather more user data, we aim to offer even more tailored health recommendations and resources. 

## Prerequisites for Running the App

Ensure you have the following installed on your local development machine:

### Ruby Installation
- Install rbenv using these [instructions](https://github.com/rbenv/rbenv#installation)
- Run the following commands:
```bash
rbenv install 3.1.3
rbenv local 3.1.3
```

Verify your locally Ruby version by running `ruby -v`

### Postgres
- Refer to the following [guide](https://github.com/sidbav/public-health-app-v2/wiki/Shifting-to-PostgreSQL-for-development) to install postgres on your machine

### MailCatcher
INSTALL mailcatcher outside of ruby instance (in other words do not add it as a gem to this project) since it will lead to conflicts with this project's gems
#### MacOS Install
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

#### For windows, Linux, etc:
Please follow the documentation on the official [website](https://mailcatcher.me/)

## Running the App Locally

### Cloning the repo
```bash
git clone https://github.com/sidbav/public-health-app-v2.git
cd public-health-app-v2 
```

### Install Ruby Gems
```bash
bundle install
```

### Setup the database:
```bash
rails db:create
rails db:migrate
```

### To seed the database, run:
```bash
rails db:seed
```

### Running the Application
You can start the rails server using the command given below.
```bash
rails s
```

You may find [PostgreSQL Explorer](https://marketplace.visualstudio.com/items?itemName=ckolkman.vscode-postgres) VS code extension helpful during development. 

## How to run the test suite
### Cucumber Test
```bash
rails cucumber 
## OR
bundle exec cucumber
```

### Rspec
```bash
rails spec
## OR
bundle exec rspec
```

### Code Coverage with SimpleCov
After running both cucumber and rspec test cases refer to `coverage/index.html` to view the code coverage report (in your browser).

## Heroku Deployment Instructions
- Refer to the [wiki page](https://github.com/sidbav/public-health-app-v2/wiki/Heroku-App-Deployment) for instructions on how to deploy to Heroku.


## Services (job queues, cache servers, search engines, etc.)
The application utilizes Google Maps' search engine to return relevant venues near the user's zipcode.


