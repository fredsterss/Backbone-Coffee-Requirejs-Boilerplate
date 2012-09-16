define [
    "jquery"
    "backbone"
    ], ($, Backbone) ->
  
    class DefaultView extends Backbone.View

        initialize: (opts) ->
            _.bindAll @

        render: ->
            @$el.html('HAI WORLD')

        # Returns the Router class
        DefaultView