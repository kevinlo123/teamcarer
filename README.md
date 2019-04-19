# Teamcarer

## Development

* Ruby version: `Ruby 2.5.1p57`

* Rails version: `Rails 5.2.1`

* System dependencies: `bundle install`

* Database setup:`rake db:setup`

* Database initialization:`rake db:migrate`

* Database rollback to last migration:`rake db:rollback`

* Database drop:`rake db:drop`

* Rails CLI help:`rails -h`

* Rails console:`rails console`

## Deployment

**Link to project:**(for testing purposes)
https://teamcarer.herokuapp.com/

**For more about all rails db tasks and what they do visit:**
https://jacopretorius.net/2014/02/all-rails-db-rake-tasks-and-what-they-do.html

**Deployment:**

* Push up to the repository on github then run `git push heroku master` from the terminal to deploy to our Heroku instance

* Heroku console:`heroku run rails console`

* Heroku migration:`heroku run rake db:migrate`

* Heroku logs:`heroku logs --tail`

* Heroku database reset and clean: `heroku restart; heroku pg:reset DATABASE --confirm teamcarer; heroku run rake db:migrate`
