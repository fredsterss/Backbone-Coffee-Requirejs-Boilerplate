define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    tmplTest    = require 'hbs!templates/test'
    ->
  
    class ExampleView extends Backbone.View

        initialize: (opts) ->
            _.bindAll @

        render: ->
            @$el.html(tmplTest())

        # Returns the Router class
        ExampleView