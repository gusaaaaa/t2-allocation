'use strict'

sync = require('../lib/webdriver-sync')
connect = require('connect')
express = require('express')

createWebServer = (port)->
  app = express()
    #.use(connect.logger('dev'))
    .use (req, res, next)->
      res.setHeader('Access-Control-Allow-Origin', req.headers.origin);
      res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With, Authorization, accept, origin');
      res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
      next()
  conn = null

  result =
    serveDir: (dir)->
      app.use(connect.static(require('path').resolve(dir)))
      @

    when: app

    start: ->
      sync ->
        conn = app.listen port

    stop: ->
      sync ->
        conn.close ->
          conn = null

module.exports = createWebServer
