http      = require 'http'
express   = require 'express'
app       = express()
newMeteor = require 'new-meteor'
server = http.createServer app

x = 0
methods =
  hello: (arg1, arg2) ->
    x = x + 1

collections = ['users']
newMeteor.addClientScript 'clientScript.coffee'
newMeteor.init server, methods, collections


app.use newMeteor.express
app.use express.static 'public'

app.get '/some-other-page', (req, res) ->
  res.send '<h1>Some static page</h1>'

server.listen 4000
