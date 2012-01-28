namespace :macgap do
  task :build do
    # `sips -s format icns macgap/application3.png --out macgap/application.icns`
    `macgap --name Dashboard ./macgap`
    `zip -r Dashboard.zip Dashboard.app`
  end
end