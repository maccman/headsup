# Heads Up

http://cl.ly/DiOh

# Running

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

# Building MacGap

    rake macgap:build