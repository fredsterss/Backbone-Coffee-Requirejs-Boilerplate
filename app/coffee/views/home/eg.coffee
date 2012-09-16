define [
    "jquery"
    "backbone"
    "hbs!templates/test"
    ], ($, Backbone, tmplTest) ->
  
    class ExampleView extends Backbone.View

        initialize: (opts) ->
            _.bindAll @

        render: ->
            @$el.html(tmplTest())

        # Returns the Router class
        ExampleView