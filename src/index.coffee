app = require 'app'
BrowserWindow = require 'browser-window'

mainWindow = null

app.on 'window-all-closed', -> app.quit()

app.on 'ready', ->
  mainWindow = new BrowserWindow width: 640, height: 480
  mainWindow.loadUrl 'file://' + __dirname + '/index.html'
  mainWindow.on 'close', -> mainWindow = null
