@BF.module "DashboardApp", (DashboardApp, App, Backbone, Marionette, $, _) ->

  class DashboardApp.Router extends Marionette.AppRouter
    appRoutes:
      'dashboard': 'show'

  API =
    show: ->
      new DashboardApp.Show.Action

  App.addInitializer ->
    new DashboardApp.Router
      controller: API
