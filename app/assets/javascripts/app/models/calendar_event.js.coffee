$ = jQuery

class App.CalendarEvent extends Spine.Model  
  @configure 'Event', 'name', 'link', 'start_at', 'end_at'
  @extend Spine.Model.Ajax
  @url: '/app/calendar'
    
  load: ->
    super
    @start_at = new Date(@start_at)
    @end_at = new Date(@end_at)
    
  @bind 'ajaxError', (e) ->
    if e.status is 403
      window.location = '/authorize'