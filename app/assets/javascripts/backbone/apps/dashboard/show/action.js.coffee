@BF.module "DashboardApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Action extends App.Actions.BaseAction

    initialize: ->
      @layout = @getLayout()
      @show @layout

    getLayout: ->
      new Show.Layout
