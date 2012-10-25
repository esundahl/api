# Connect to the database
mongo = require('mongoskin')
db = mongo.db('localhost:27017/api')

routes = (app) ->


  # GET /:resource
  app.get '/:resource', (req, res) ->
    resource = db.collection(req.params.resource)
    resource.find().toArray (err, docs) ->
      throw err if err
      res.json docs


  # POST /:resource
  app.post '/:resource', (req, res) ->
    resource = db.collection(req.params.resource)
    resource.insert req.body, (err, docs) ->
      throw err if err
      res.json docs


  # GET /:resource/:id
  app.get '/:resource/:id', (req, res) ->
    resource = db.collection(req.params.resource)
    resource.findById req.params.id, (err, docs) ->
      throw err if err
      res.json docs


  # PUT /:resource/:id
  app.put '/:resource/:id', (req, res) ->
    delete req.body._id
    resource = db.collection(req.params.resource)
    resource.updateById req.params.id, req.body, {}, (err, docs) ->
      throw err if err
      res.json docs


  # DELETE /:resource/:id
  app.delete '/:resource/:id', (req, res) ->
    resource = db.collection(req.params.resource)
    resource.removeById req.params.id, {}, (err, docs) ->
      throw err if err
      res.send json


module.exports = routes
