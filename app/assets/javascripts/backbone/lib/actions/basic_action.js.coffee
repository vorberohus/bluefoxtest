@BF.module "Actions", (Actions, App, Backbone, Marionette, $, _) ->

  class Actions.BaseAction extends Marionette.Object

    constructor: (options={}) ->
      @region = options.region or App.request 'default:region'
      super options

    show: (view) ->
      @listenTo view, 'destroy', @destroy
      @region.show view
  
    onDestroy: ->
      console.log 'destroing', @
