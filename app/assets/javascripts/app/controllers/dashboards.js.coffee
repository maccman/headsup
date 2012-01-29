$ = jQuery

class Calendar extends Spine.Controller
  className: 'calendar'
  
  constructor: ->
    super
    @el.hide()
    
  render: (events = App.CalendarEvent.all()) =>
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
    
  render: (emails = App.Email.all()) =>
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
    $.when(
      App.CalendarEvent.ajax().fetch(),
      App.Email.ajax().fetch()
    ).done =>    
      @append(@calendar = new Calendar)
      @append(@email = new Email)
      @calendar.render()
      @email.render()
    
  change: ->
    @user.note = @textarea.val()
    @user.save()