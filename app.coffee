# Module dependencies
express = require('express')
http = require('http')
path = require('path')
mongo = require('mongoskin')

app = express()

app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'jade'
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser('your secret here')
  app.use express.session()
  app.use express.static(path.join(__dirname, 'public'))

app.configure 'development', ->
  app.use express.errorHandler()

# Routes
require('./routes/resources.coffee')(app)


http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get('port')}"
