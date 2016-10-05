# BeerExplorer

##### About
This project represents the personal project that is the culmination of 3 modules at Turing School of Software and Design. I worked with the external api [Brewery DB](http://www.brewerydb.com/developers/docs). This was a two week individual project to demonstrate proficiency in advanced Rails concepts as well as API consumption. The project taught me a lot about the benefits and faults of working with an external API. I was excited to have the chance to incorporate many new technologies in this project including Redis and Sidekiq as well as a small bit of React on Rails.

Core requirements for the project can be found at [this repo](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/self_directed_project.md)

##### The Production app can be found [here](https://beerexplorer.herokuapp.com)

This app is a rails application hosted in production on heroku.

##### Technologies Used:
* Google oauth2
* Redis with Sidekiq
* React Rails
* Ajax/JQuery
* Rails MVC design
* TDD with Capybara, VCR, ShouldaMatchers
* Rails Caching

##### Local Setup
```
git clone git@github.com:lucyfox4131/beer_explorer.git
cd beer_explorer
bundle
rake db:migrate
rails s

To run the tests:
rake tmp:cache:clear
rspec
```
##### Things I'd like To Improve
* Styling: The UI could use some major improvements, buttons could be prettier
* Add feature to add to DB when search results don't exist
