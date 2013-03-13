define (require) ->
    $                   = require 'jquery'
    _                   = require 'lodash'
    Backbone            = require 'backbone'

    tmplExample         = require 'hbs!templates/example' # syntax for including handlebars templates
    ->
  
    class ExampleView extends Backbone.View

        className: 'example'

        render: ->

            # @$el = this.$el = $(this.el)
            # backbone caches the jquery 
            @$el.html tmplExample { thing: 'Some string' }

            # pass the view back to the caller so it has access to this view's el
            return @