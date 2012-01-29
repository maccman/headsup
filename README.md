# Heads Up

A simple Heads Up display showing your calendar items for today, your unread emails and custom notes.

[Download the OSX app](http://cl.ly/DlQR) or try the [live demo](https://maccman-headsup.herokuapp.com/).

![Heads Up](http://f.cl.ly/items/0w0P0j1s0X3D0L1p2J0A/Screen%20Shot%202012-01-29%20at%2008.42.14.png)

Heads Up contains good examples of how to use:

* [Spine](http://spinejs.com)
* [GFX](http://github.com/maccman/gfx)
* [Omniauth](https://github.com/intridea/omniauth)
* [MacGap](http://github.com/maccman/macgap)
* [Nestful](http://github.com/maccman/nestful)
* [Rack::Offline](http://github.com/maccman/rack-offline)

## Source

If you're browsing the source, the interesting files are:

* [`dashboard.js.coffee`](https://github.com/maccman/headsup/blob/master/app/assets/javascripts/app/controllers/dashboards.js.coffee)
* [`authorize_controller.rb`](https://github.com/maccman/headsup/blob/master/app/controllers/authorize_controller.rb)
* [`user.rb`](https://github.com/maccman/headsup/blob/master/app/models/user.rb)
* [`google.rb`](https://github.com/maccman/headsup/blob/master/lib/google.rb)

## Google keys

If you're running the app locally, or using Heroku, you'll first need to obtain a set of [API keys from Google](https://code.google.com/apis/console/), as well as specify the correct redirect URLS:

![Redirect URLS](http://f.cl.ly/items/1R323Y3h2F322h211g1j/Screen%20Shot%202012-01-29%20at%2008.50.48.png)

## Running locally

    git clone git://github.com/maccman/headsup.git
    cd headsup

    bundle
    rake db:setup
    export GOOGLE_KEY=mykey GOOGLE_SECRET=mysecret
    
    rails s thin
    
## Deploying to Heroku

    git clone git://github.com/maccman/headsup.git
    cd headsup
    
    heroku create myapp --stack cedar
    heroku addons:add piggyback_ssl
    heroku config:add GOOGLE_KEY=mykey GOOGLE_SECRET=mysecret
    
    git push heroku master
    heroku run rake db:setup

## Building the app with MacGap

[MacGap](http://github.com/maccman/macgap) is a utility for wrapping up web apps with a WebKit wrapper, and exposing a basic OS integration API. 

If you want to built the MacGap application, you'll first have to edit the iframe endpoint in `./macgap/index.html` to point to your remote application, and then run:

    rake macgap:build