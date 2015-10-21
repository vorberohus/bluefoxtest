@BF.module "Utilities", (Utilities, App, Backbone, Marionette, $, _) ->
  
  _.extend App,

    navigate: (route, options={}) ->
      #set defaults if needed
      route = '#'+route if route.charAt(0) != '#'
      console.log route
      Backbone.history.navigate route, options

    getCurrentRoute: ->
      frag = Backbone.history.fragment
      if _.isEmpty frag then null else frag

    startHistory: ->
      if Backbone.history
        Backbone.history.start()
