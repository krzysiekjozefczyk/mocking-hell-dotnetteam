require_relative '../lib/host_app'

app = HostApp.new(ConsoleIo.new)
app.populate
app.run
