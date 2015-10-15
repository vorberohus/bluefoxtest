@BF = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.rootRoute = Routes.dashboard_path()

  App.addRegions
    headerRegion: '#header-region'
    mainRegion:   '#main-region'
   #dialogRegion: Marionette.Region.Dialog.extend el: '#dialog-region'

  App.addInitializer ->
    App.module('HeaderApp').start()

  App.reqres.setHandler "default:region", ->
   App.mainRegion

  App.on 'start', ->
    if Backbone.history
      Backbone.history.start()
      @navigate @rootRoute, trigger: true unless @getCurrentRoute()
    else
      console.log 'Can not start Backbone.history!'
  App

doc = $(document)

doc.foundation()

doc.on 'ready', =>
  @BF.start()
