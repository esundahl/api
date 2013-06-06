API
=====================

This is a simple restful resource server that accepts any resource as the first url paramater. It is meant to be used locally as a development api and has no authentication or security built in.


Usage
-----

First start a mongodb server on port 27017 then run the index.coffee application. Finally save resources using the following routes


Returns a JSON object with all documents in the collection :resource
```    
GET http://localhost:3000/:resource
```

Writes a new document to the collection :resource
```    
POST http://localhost:3000/:resource
```

Returns a JSON object from the collection :resource with the id :id
```    
GET http://localhost:3000/:resource/:id
```

Updates the object with :id in the collection :resource
```    
PUT http://localhost:3000/:resource/:id
```

Deletes the object from the collection :resource with the id :id
```    
GET http://localhost:3000/:resource/:id
```

License
-------

(The MIT License)

Copyright (c) 2012 Erik Sundahl <esundahl@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
