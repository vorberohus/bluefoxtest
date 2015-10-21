@BF.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Action extends App.Actions.BaseAction

    initialize: ->
      menu = App.request 'get:header:menu:entities'
      view = @getHeaderView(menu)
      @show view

    getHeaderView: (entities) ->
      new Show.MenuView
        collection: entities
