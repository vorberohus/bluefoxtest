@BF.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  
  @startWithParent = false

  API =
    show: ->
      new HeaderApp.Show.Action
        region: App.headerRegion

  HeaderApp.on "start", ->
    API.show()
