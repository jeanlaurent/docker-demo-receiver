#!/usr/bin/env coffee
express = require 'express'

port = 9000
app = express()

app.listen port
app.disable 'etag'
app.disable 'x-powered-by'

console.log "server listening on #{port}"
console.log "send me messages to test with echo \"hello world\" | http post localhost:#{port}"

app.get '/', (request, response) ->
  response.set 'Content-Type', 'text/plain'
  response.send 'This aren\'t the droids you\'re looking for !'

app.post '/', (request, response) ->
  request.pipe process.stdout
  response.sendStatus 200
