minimongo = require 'minimongo'
db = new minimongo.LocalStorageDb()

NM.useDatabase nmMinimongoDriver db
NM.init ->
  x = yield this.call('hello')
  y = yield this.call('hello')
  console.log('x,y=',x, y)

  db.users.findOne {name:'jeroen'}, (res) ->
    console.log 'res', res

  NM.call('hello') (err, res) ->
    console.log('async', res)
