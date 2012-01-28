class App.Email extends Spine.Model
  @configure 'Email', 'subject', 'summary', 'link', 'sent_at'
  @extend Spine.Model.Ajax
  @url: '/app/email'
  
  load: ->
    super
    @sent_at = new Date(@sent_at)