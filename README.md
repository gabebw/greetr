# Greetr

Send a greeting to your friends!

This is a Rails app running on [Heroku](http://send-a-yo.herokuapp.com).

It uses Pusher and Websockets to instantly update your page of greetings, ensuring
that you know exactly how popular you are (or aren't).

## Features

* New greetings pop up instantly without reloading the page
* As users sign up, their usernames are added to the dropdown via Pusher so that
  you can immediately greet them without reloading the page
* If the Greetr tab does not have focus, the title changes to show the number of
  unread greetings (e.g. `(2) Greetr`).

## Set up

Run:

    ./bin/setup

And follow the instructions on-screen.

## Legalese

Legally not affiliated with Yo, the Yo app, or any of their scary lawyers.
