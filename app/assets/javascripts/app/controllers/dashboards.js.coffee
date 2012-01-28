$ = jQuery

class Calendar extends Spine.Controller
  className: 'calendar'
  
  constructor: ->
    super
    @el.hide()
    request = $.getJSON('/app/calendar')
    request.success(@render).error(@error)
    
  render: (events) =>
    @html @view('dashboard/calendar')(events: events)
    @el.gfxSlideIn(
      direction: 'left',
      duration: 450,
      easing: 'cubic-bezier(.25, .1, .25, 1)'
    )
    
  # Google session token has expired
  error: =>
    window.location = '/authorize'

class Email extends Spine.Controller
  className: 'email'
  
  constructor: ->
    super
    @el.hide()
    $.getJSON('/app/email', @render)
    
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
    'blur textarea': 'blur'
  
  constructor: ->
    super
    @render()
  
  render: ->
    @html @view('dashboard')(user: @user)
    @append(new Calendar)
    @append(new Email)
    
  blur: ->
    @user.note = @textarea.val()
    @user.save()