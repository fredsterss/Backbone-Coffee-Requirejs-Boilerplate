define [
    "jquery"
    "backbone"
    "views/misc/app"
    "models/UserModel"
    "views/UserView"
    "collections/UsersCollection"
    ], ($, Backbone, AppView, UserModel, UserView, UsersCollection) ->
  
    class Router extends Backbone.Router

        initialize: ->


            # Enable pushState for compatible browsers
            enablePushState = true

            # Disable for older browsers
            pushState = !!(enablePushState && window.history && window.history.pushState)

            # Tells Backbone to start watching for hashchange events
            Backbone.history.start()



        
        # All of your Backbone Routes (add more)
        routes:

            # When there is no hash bang on the url, the home method is called
            "": "home"


        home: ->

            # Creates a new Model instance and sets default values
            user = new UserModel().set
                firstname: "Greg"
                lastname: "Franko"
                email: "example@gmail.com"
                phone: "703-243-7371"

            # Creates a new Collection instance (Adds the previous Model instance to the Collection)
            users = new UsersCollection([user])

            # Declares the View's collection instance property
            mainView = new UserView(collection: users)

            # Renders all of the User Model's to the page
            mainView.render()


        # Returns the Router class
        Router