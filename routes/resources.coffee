# Connect to the database
mongo = require('mongoskin')
db = mongo.db('localhost:27017/api')

routes = (app) ->


  # GET /bookmarks
  app.get '/:resource', (req, res) ->
    resource = db.collection(req.params.resource)
    resource.find().toArray (err, docs) ->
      throw err if err
      res.send docs


  # POST /bookmarks
  app.post '/:resource', (req, res) ->
    resource = db.collection(req.params.resource)
    resource.insert req.body, (err, docs) ->
      throw err if err
      res.send docs


  # GET /bookmarks/:id
  app.get '/:resource/:id', (req, res) ->
    resource = db.collection(req.params.resource)
    resource.findById req.params.id, (err, docs) ->
      throw err if err
      res.send docs


  # PUT /bookmarks/:id
  app.put '/:resource/:id', (req, res) ->
    delete req.body._id
    resource = db.collection(req.params.resource)
    resource.updateById req.params.id, req.body, {}, (err, docs) ->
      throw err if err
      res.send docs


  # DELETE /bookmarks/:id
  app.delete '/:resource/:id', (req, res) ->
    resource = db.collection(req.params.resource)
    resource.removeById req.params.id, {}, (err, docs) ->
      throw err if err
      res.send docs


module.exports = routes
