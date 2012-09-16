define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    AppView     = require 'views/misc/app'
    ExampleView = require 'views/home/eg'
    ->

    # The main router for the whole app
    class Router extends Backbone.Router
        
        # All of your Backbone Routes (add more)
        routes:

            # When there is no hash bang on the url, the home method is called
            "": "home"



        home: ->

            exampleView = new ExampleView
            @appView.showView(exampleView)



        initialize: ->

            @appView = new AppView

            # Enable pushState for compatible browsers
            enablePushState = true

            # Disable for older browsers
            pushState = !!(enablePushState && window.history && window.history.pushState)

            # Tells Backbone to start watching for hashchange events
            Backbone.history.start({pushState: pushState})        


        # Returns the Router class
        Router