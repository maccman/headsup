$ = jQuery

class Calendar extends Spine.Controller
  className: 'calendar'
  
  constructor: ->
    super
    @el.hide()
    App.CalendarEvent.bind 'refresh', @render
    App.CalendarEvent.fetch()
    
  render: (events) =>
    @html @view('dashboard/calendar')(events: events)
    @el.gfxSlideIn(
      direction: 'left',
      duration: 450,
      easing: 'cubic-bezier(.25, .1, .25, 1)'
    )
    
class Email extends Spine.Controller
  className: 'email'
  
  constructor: ->
    super
    @el.hide()
    App.Email.bind 'refresh', @render
    App.Email.fetch()
    
  render: (emails) =>
    @html @view('dashboard/email')(emails: emails)
    @el.delay(300).gfxSlideIn(
      direction: 'left',
      duration: 450,
      easing: 'cubic-bezier(.25, .1, .25, 1)'
    )

class App.Dashboard extends Spine.Controller
  className: 'dashboard'
    
  elements:
    'textarea': 'textarea'
    
  events:
    'change textarea': 'change'
  
  constructor: ->
    super
    @render()
  
  render: ->
    @html @view('dashboard')(user: @user)
    @append(new Calendar)
    @append(new Email)
    
  change: ->
    @user.note = @textarea.val()
    @user.save()