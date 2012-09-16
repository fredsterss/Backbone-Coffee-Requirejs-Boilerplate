define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    ->

    class AppView extends Backbone.View

        initialize: (opts) ->
            _.bindAll @

        showView: (view) ->

            # if a currentView exists, close it before rendering the new view
            if @currentView?
                @currentView.close()

            # render the new view
            @currentView = view
            @currentView.render()

            # insert the view into the htmlz
            $('#page').html(@currentView.el)

    AppView