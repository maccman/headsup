$ = jQuery

class App.CalendarEvent extends Spine.Model  
  @configure 'Event', 'name', 'link', 'start_at', 'end_at'
  @extend Spine.Model.Ajax
  @url: '/app/calendar'
    
  load: ->
    super
    @start_at = new Date(@start_at)
    @end_at = new Date(@end_at)
    
  @bind 'ajaxError', (_, e) ->
    if e.status is 401
      # Safari iframe cookie fix
      form = $('<form />').attr('action', '/authorize')
      form.appendTo('body').submit()