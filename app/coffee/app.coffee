###############################
### Require.js config
###############################
require.config

    # 3rd party script alias names (Easier to type "jquery" than "libs/jquery-1.7.2.min")
    paths:
        
        # Core Libraries
        jquery: "libs/jquery"
        lodash: "libs/lodash"
        backbone: "libs/backbone"
        backbone_extensions: "libs/backbone.extensions"
        hbs: "libs/hbs" # hbs is how we deal with handlebars templatez
        Handlebars: "libs/Handlebars"
        templates: "../templates"
        async: 'libs/async'
        async_extensions: 'libs/async.extensions'

  
    # Sets the configuration for your third party scripts that are not AMD compatible
    shim:

        # Twitter Bootstra4p jQuery plugins
        backbone:
            deps: ["lodash", "jquery"]
            exports: "Backbone" #attaches "Backbone" to the window object

        lodash:
            exports: "_"

        backbone_extensions:
            deps: ["backbone"]

        async_extensions:
            deps: ["async"]
            exports: "async"
        
        Handlebars:
            exports: "Handlebars"


    # Settings for the handlebars implementation
    hbs:

        # callback to determine path to look for helpers
        helperPathCallback: (name) ->
            "helpers/all"

        templateExtension: "hbs"

        # if disableI18n is `true` it won't load locales and the i18n helper
        # won't work as well.
        disableI18n: true



###############################
### Instantiate your app
###############################
define (require) ->

    # Basic stuff required everywhere
    $                   = require 'jquery'
    _                   = require 'lodash'
    Backbone            = require 'backbone'
    backbone_extensions = require 'backbone_extensions'
    async               = require 'async'
    async_extensions    = require 'async_extensions'

    # controllers
    GenericController   = require 'controllers/generic'
    ->

    ###############################
    ### Global environment setup
    ###############################
    # We made some pretty major changes, based mostly on ideas from 
    # Mike Knoop at Zapier (https://github.com/mikeknoop) who is a 
    # friggin' genius. 

    # The basic idea is that you add all the objects that you'll be
    # using around your app to a single global object, and that way
    # you don't have to fuck around with passing the same data around
    # tons of times, and can instead defer to the global object.
    
    # We use 'r' as the base object because our app is called Rainforest, 
    # but you should use whatever you want.

    # access to our 'r' namespace
    window.r = {}

    # static config variables
    r.config = {}

    # instantiated controllers
    r.controllers = {}

    # reusable ui components
    r.ui = {}


    ###############################
    ### Event aggregator
    ###############################
    # It's also a great idea to use an event aggregator, as a central
    # place you can listen to events on that can be accessed from anywhere
    # in your app. Here we generally add a listener to update document.title
    r.events = _.extend {}, Backbone.Events


    ###############################
    ### Assign static variables
    ###############################
    # this is where we assign all our static variables, like API endpoints
    # and controllers.

    # Api versioning
    r.config.api = '/api/1'

    # instantiate controllers
    # (we use backbone routers as controllers, and defer nearly all state
    # handling to them. you need to instantiate at least one controller
    # so that when we start Backbone.history there are routes to check against)
    r.controllers.generic   =   new GenericController



    ###############################
    ### Initialize routers
    ###############################
    $(document).ready () ->

        start = ->

            # Enable pushState for compatible browsers
            enablePushState = true

            # Disable for older browsers
            pushState = !!(enablePushState && window.history && window.history.pushState)

            # Tells Backbone to start watching for hashchange events
            Backbone.history.start({pushState: pushState})

        start()



