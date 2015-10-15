@BF.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Application

    initialize: ->
      menu = App.request 'get:header:menu:entities'
      view = @getHeaderView(menu)
      @show view

    getHeaderView: (entities) ->
      new Show.MenuView
        collection: entities
