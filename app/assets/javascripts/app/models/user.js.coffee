class App.User extends Spine.Model
  @configure 'User', 'first_name', 'last_name', 'note', 'avatar_url'
  @extend Spine.Model.Ajax