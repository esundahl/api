# Connect to the database
mongo = require('mongoskin')
db = mongo.db('localhost:27017/api')


routes = (app) ->


  # Before Filter
  before = (req, res, next) ->
    app.collection = db.collection(req.params.resource)
    next()


  # GET /:resource
  app.get '/:resource', before, (req, res) ->
    app.collection.find().toArray (err, docs) ->
      throw err if err
      res.json docs


  # POST /:resource
  app.post '/:resource', before, (req, res) ->
    app.collection.insert req.body, (err, docs) ->
      throw err if err
      res.json docs


  # GET /:resource/:id
  app.get '/:resource/:id', before, (req, res) ->
    app.collection.findById req.params.id, (err, docs) ->
      throw err if err
      res.json docs


  # PUT /:resource/:id
  app.put '/:resource/:id', before, (req, res) ->
    delete req.body._id
    app.collection.updateById req.params.id, req.body, {}, (err, docs) ->
      throw err if err
      res.json docs


  # DELETE /:resource/:id
  app.delete '/:resource/:id', before, (req, res) ->
    app.collection.removeById req.params.id, {}, (err, docs) ->
      throw err if err
      res.json docs


module.exports = routes
