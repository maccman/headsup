# Heads Up

A simple Heads Up display showing your calendar items for today, your unread emails and custom notes.

A good example of how to use:

* [Spine](http://spinejs.com)
* [GFX](http://github.com/maccman/gfx)
* [Omniauth](https://github.com/intridea/omniauth)
* [MacGap](http://github.com/maccman/macgap)
* [Nestful](http://github.com/maccman/nestful)
* [Rack::Offline](http://github.com/maccman/rack-offline)

[Download the OSX app](http://cl.ly/DlQR) or try the [live demo](https://maccman-headsup.herokuapp.com/).

![Heads Up](http://f.cl.ly/items/0w0P0j1s0X3D0L1p2J0A/Screen%20Shot%202012-01-29%20at%2008.42.14.png)

# Running locally

    git clone git://github.com/maccman/headsup.git
    cd headsup

    bundle
    rake db:setup
    rails s thin
    
# Deploying to Heroku

    git clone git://github.com/maccman/headsup.git
    cd headsup
    
    heroku create myapp --stack cedar
    heroku addons:add piggyback_ssl
    git push heroku master
    heroku run rake db:setup

# Building the app with [MacGap](http://github.com/maccman/macgap)

    rake macgap:build