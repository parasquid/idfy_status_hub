# IDfy StatusHub

This repo was made for the [IDfy Full Stack Developer Hiring Challenge](https://www.hackerearth.com/idfy-full-stack-developer-hiring-challenge).

The app is currently [hosted at heroku](https://afternoon-hollows-8460.herokuapp.com/).

I've enabled the `deploy to heroku` functionality to make it really easy to deploy. Just click on the button below.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

If you want to hack on it yourself, just `git clone` this repo and after you're done with `rake db:create db:migrate` you will need to run `rake members:create_or_update` in order to seed the database.

This project uses the `postgresql` database; you might need to set it up on your own if you're doing local development.

# About this app

This is a plain vanilla rails app without much fanfare; it was made for a 12 hour hackathon so there's not much time to experiment on some fancy functionalities.

This app fulfills the project's minimum requirements:

* fetch the member details via the given API
* convert ethnicity from `Integer` to `Text`
* convert weight from `grams` to `kilograms`
* list status and categorize ethnicity

This app fulfills almost all of the plus points:

* infinite scroll and API paging
* easy setup with instructions (deploy to heroku)
* favourite status and list favourited status
* download member details as PDF

This app fulfilled just one of the advanced requirements:

* host the application with a demo url (https://afternoon-hollows-8460.herokuapp.com/)

# Some caveats

* The list of favourited statuses are stored in a serialized JSON array in a cookie. There was no mention of user accounts, and I didn't want to assume that user accounts were a feature that the app requires. I've designed the internal API such that it would be easy to swap the storage mechanism to a full database if that's needed.
* Since the member api does is not very flexible with regard to filtration and searches, I opted to download the full member list and do the queries from a local database. The intention is to have a background worker periodically refresh the local copy from the API, either via a callback (the api will tell the app when there is new data to be fetched) or through polling.