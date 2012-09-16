define [ 
    "jquery"
    "underscore"
    "backbone"
], ($, _, Backbone) ->

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

            $('#page').html(@currentView.el)

    AppView