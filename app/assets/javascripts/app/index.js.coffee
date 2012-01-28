#= require json2
#= require jquery
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

class App extends Spine.Controller
  events:
    'click a': 'clickLink'
  
  constructor: ->
    super
    
    throw('User required') unless @user
    @user = App.User.create(@user, ajax: false)
    
    @append(@dashboard = new App.Dashboard(user: @user))
    
    @el.transform
      scale:   '.8'
      opacity: '0'

    @el.delay(100).show().gfx
      scale:   '1'
      opacity: '1'
    
    Spine.Route.setup()
    
  clickLink: (e) ->
    e.preventDefault()
    href = $(e.currentTarget).attr('href')
    if macgap?
      macgap.app.open(href)
    else
      window.open(href)    

window.App = App