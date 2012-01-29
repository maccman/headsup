namespace :macgap do
  task :build do
    `macgap --name HeadsUp ./macgap`
    `zip -r HeadsUp.zip HeadsUp.app`
  end
end