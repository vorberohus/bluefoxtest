@BF.module "DashboardApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.LayoutView
    template: 'dashboard/show/layout'
