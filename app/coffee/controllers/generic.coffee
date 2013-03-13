define (require) ->
    $                   = require 'jquery'
    _                   = require 'lodash'
    Backbone            = require 'backbone'

    ExampleView         = require 'views/example'
    ->
    
    # We use Routers as controllers, and try to move the majority
    # of state-management logic from the View to the controller. 
    # The view then just handles UI stuff.
    class GenericController extends Backbone.Router

        routes:
            ""   :   "example"

        # An example route:
        example: ->

            # instantiate example view
            exampleView = new ExampleView

            # insert example view into page
            $('#page').html exampleView.render().el


        GenericController