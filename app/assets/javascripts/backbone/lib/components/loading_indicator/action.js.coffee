#Loading Indicator
@BF.module "Components.LoI", (LoI, App, Backbone, Marionette, $, _) ->

  class LoI.Action extends App.Actions.BaseAction

    initialize: ->
      console.log 'loading'
