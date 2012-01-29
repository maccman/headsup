namespace :macgap do
  task :build do
    `sips -s format icns macgap/application.png --out macgap/application.icns`
    `macgap --name HeadsUp ./macgap`
    `zip -r HeadsUp.zip HeadsUp.app`
  end
end