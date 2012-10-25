# Module dependencies
express = require('express')
http = require('http')
mongo = require('mongoskin')

app = express()

app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()

app.configure 'development', ->
  app.use express.errorHandler()

# Routes
require('./routes/resources.coffee')(app)


http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get('port')}"
