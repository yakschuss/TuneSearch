##TuneSearch

Steps to run locally:

1. Clone Repo
2. Ensure PostgreSQL is installed AND running
3. run `bundle install`
4. `rake db:create` `rake db:migrate` `rake db:seed`
5. `rails s`
6. go to `localhost:3000`
7. Enjoy!

Note: Data is randomly seeded by using `rake db:seed`. If you want to see all
data in the db, hitting search with empty parameters will return a full list.

You can then make calls while on that page.


