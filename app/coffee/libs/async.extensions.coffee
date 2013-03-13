# backbone fetch + async lib helper method, automatically routes
# the callback from success/error to the async required callback
async.fetch = (model) ->

    return (callback) ->

        model.fetch
            success: (model, response) ->
                callback null, model
                
            error: (model, xhr) ->
                # process failure with errorhandler
                r.app.errorHandler.handle(xhr)
                callback xhr.responseText, model