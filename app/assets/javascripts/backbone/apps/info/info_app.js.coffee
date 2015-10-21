@BF.module "InfoApp", (InfoApp, App, Backbone, Marionette, $, _) ->

  App.commands.setHandler 'info:alert', (message) ->
    new InfoApp.Show.Action
      region: App.infoRegion
      message: message
