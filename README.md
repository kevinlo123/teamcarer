# Teamcarer
TeamCarer is an online platform that connects families and caregivers for in-home senior care. Caregivers sign up, work in teams to help seniors live independently at home by offering services such as bathing, dressing, grooming, house cleaning, meal preparation, medication reminders, memory impairment support, and companion care. 

This web application is also made simple and easy to use for families that would like to request services for a loved one or for a caregiver to find potential clients.

**Link to project:**(for testing purposes)
https://teamcarer-sample.herokuapp.com/

## Screen shots
![Screen Shot 2019-04-18 at 11 35 13 PM](https://user-images.githubusercontent.com/29260507/56436238-1ef6da00-62a9-11e9-82c7-bc67701d8cf1.png)
<img width="1280" alt="Screen Shot 2019-04-18 at 11 35 52 PM" src="https://user-images.githubusercontent.com/29260507/56436243-2ae29c00-62a9-11e9-841e-34c4963bcdf7.png">
<img width="1280" alt="Screen Shot 2019-04-18 at 11 35 36 PM" src="https://user-images.githubusercontent.com/29260507/56436245-2ddd8c80-62a9-11e9-8a0b-46a2a48a2747.png">
<img width="1280" alt="Screen Shot 2019-04-19 at 1 42 17 PM" src="https://user-images.githubusercontent.com/29260507/56436250-303fe680-62a9-11e9-83c8-dd1cd5d10b4a.png">
<img width="1280" alt="Screen Shot 2019-04-19 at 1 42 35 PM" src="https://user-images.githubusercontent.com/29260507/56436252-31711380-62a9-11e9-89a0-d2f16243ddcc.png">

## How It's Made:

**Tech used:** Ruby, Ruby on rails, JavaScript, Jquery, CoffeeScript, Erb, Html, SCSS, Postgresql, SQL 

I built this project as an MVP for a clients startup named Teamcarer, The rails framework really helped me get things going as I was the only developer working on this project it was easy for me to build my data models and set DB relations which is why it was a good idea to use a relational database like Postgresql. I utilized the [Devise gem](https://github.com/plataformatec/devise) for both users authentication. As well as Jquery for all my client side JavaScript programming with a slight touch of ajax for some portions of the project. I stuck with the classic Embedded Ruby (ERB) templating Engine which worked great and made use of modular BEM SCSS stylesheets to keep the frontend clean and easy to change.


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
