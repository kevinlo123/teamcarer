# Teamcarer
TeamCarer is an online platform that connects families and caregivers for in-home senior care. Caregivers sign up, work in teams to help seniors live independently at home by offering services such as bathing, dressing, grooming, house cleaning, meal preparation, medication reminders, memory impairment support, and companion care. 

This web application is also made simple and easy to use for families that would like to request services for a loved one or for a caregiver to find potential clients.

**Link to project:**(for testing purposes)
https://teamcarer-sample.herokuapp.com/

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

* Push up to the repository on github then run `git push heroku master` from the terminal to deploy to our Heroku instance

* Heroku console:`heroku run rails console`

* Heroku migration:`heroku run rake db:migrate`

* Heroku logs:`heroku logs --tail`

* Heroku database reset and clean: `heroku restart; heroku pg:reset DATABASE --confirm teamcarer; heroku run rake db:migrate`

**For more rails db tasks visit:**
https://jacopretorius.net/2014/02/all-rails-db-rake-tasks-and-what-they-do.html
