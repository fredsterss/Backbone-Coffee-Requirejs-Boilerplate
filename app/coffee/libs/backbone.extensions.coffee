###############################
### Custom backbone extensions
###############################

# Sometimes you need to extend Backbone. In our app, we override
# Backbone.sync so that we can pass custom auth headers to our
# API, in order to have client-side authentication. We also extend
# the default Backbone view with some additional rendering methods



###############################
### Sync example
###############################
# # enhance backbone sync to send custom auth headers to the server
# sync = Backbone.sync

# # then override original sync function
# Backbone.sync = (method, model, options) ->

#     # only send auth details if user has auth cookie
#     if $.cookie('your_client')?

#         # unpack client from cookie
#         client = JSON.parse($.cookie('your_client'))

#         # set custom options hash (passed through
#         # to JXHR params by Backbone) to check for
#         # in your backend
#         options.headers = { client_token: client.client_token, client_id: client.client_id }

#     # call duplicated sync function with modified
#     # attributes
#     sync(method, model, options)



###############################
### View stuff
###############################
# extend Backbone.View to add some helper functions
_.extend Backbone.View.prototype, {

    # assign, from Ian's great article 
    # http://ianstormtaylor.com/assigning-backbone-subviews-made-even-cleaner/
    # and inspired by
    # https://github.com/tbranyen/backbone.layoutmanager/blob/master/backbone.layoutmanager.js
    assign: (selector, view) ->
        if _.isObject selector
            selectors = selector

        else
            selectors = {}
            selectors[selector] = view

        if !selectors
            return

        _.each selectors, (view, selector) ->
            view.setElement(this.$(selector)).render()
        , this


    # Custom close function that removes every possible 
    # part of the view, including unbinding events, to prevent
    # zombie views taking up memory and duplicating event calls
    close: ->

        this.remove()
        this.stopListening()
        this.off()
        this.undelegateEvents()

        # allow for custom onClose events within the view
        this.onClose() if this.onClose

}

