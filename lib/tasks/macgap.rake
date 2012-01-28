namespace :macgap do
  task :build do
    `sips -s format icns macgap/application.png --out macgap/application.icns`
    `macgap --name Dashboard ./macgap`
    `zip -r Dashboard.zip Dashboard.app`
  end
end