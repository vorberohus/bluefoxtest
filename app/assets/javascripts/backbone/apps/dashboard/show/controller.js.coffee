@BF.module "DashboardApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Application

    initialize: ->
      @layout = @getLayout()
      @show @layout

    getLayout: ->
      new Show.Layout
