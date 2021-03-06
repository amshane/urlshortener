== README
##ShortenMe

---

http://shortenme.herokuapp.com

#####A Ruby on Rails app that creates a shortened URL

---

##SETUP / INSTALLATION

1. Need to have installed: homebrew, ruby and rails, and sqlite3

2. Fork and clone this repo

3. Once inside the urlshortener folder run these commands in your terminal:
..* `bundle install`
..* `rake db:migrate`

4. In the url model open up url.rb and change the `HOST_NAME`
..* In development maybe "http://localhost:300", or where ever you are hosting your app

5. Run `rails s` to test out locally

---

##CHALLENGES

1. Getting error messages to show on the homepage when user enters a invalid URL (without HTTP or HTTPS)
..*

2. Writing RSPEC tests
..* I hadn't had a lot of experience writing RSPEC tests, so I did some research and looked at other RSPEC tests that had been done. Used the `gem pry` a lot to catch my mistakes.

3. Retrieving the shortened URL if the original URL is already in the database
..* Used an if else statement that looked for the original URL in the database, and then saved the current object as the previous, or created a new object in the database, along with a new custom URL. Once I took an a look at the `find_or_create_by` method in ActiveRecord, it made this much easier, I could have also used that method instead of an if else statement.

4. Creating the shortest possible URL
..* Did some research and decided to use Base64 to encode the original url's ID to create the shortened URL

---

##DESIGN DECISIONS

1. RESTful Routes
..* Used the `new` page as my homepage where the new URL is put into the form
..* `create` created the new objects in the database, or updated a current object in the database. Through the submit button the original URL's params were used to find if the original URL already exisited in the database, if so, the current object was made updated to be the found object, if not, a new object was created, along with a new shortened URL.
..* Used the `show` page to show the link to the shortened URL, clicking on the shortened URL will update the amount of times visited for that page to add one, as well as open up the original link in a new tab
..* Used the `top100` page to show the top 100 URLs in the database by the amount of times they were visited. This page allows you to click on the original links, as well as the shortened links, and open a new tab when clicked.

2. Bootstrap
..* Used bootstrap to design a clean and simple layout that was easy to navigate with the navigation bar

3. Validations
..* Setup validations to check if the form had been filled out, as well as to make sure that the user had an input with a valid URL of HTTP or HTTPS

---

##MY SHORT URL SCHEME

To make my URL as short as possible I started off by using numbers 1-9 and letters a-z, as well as A-Z.  In my algorithim I start with one randomly generated character until all characters in that set have been used, and then add a second character in the same way until those are all used.  That method continues the same way adding characters from there until they are all used.  I chose not to use the number '0' so it would not be confused with the letter 'O'.

--

##FUTURE IMPROVEMENTS

1. I would like to setup a User table so that the user can access their previously viewed URLs, as well as their top URLs. This would also include a user sign-in and profile.

2. Change the `HOST_NAME` to something shorteer.

3. Use javascript and AJAX so that when there is an error thrown the page does not reload, as well as on the top100 page when a link is clicked the page automatically updates the amount of times the site has been visited, instead of needing to reload the top100 page.