@BF.module "Controllers", (Controllers, App, Backbone, Marionette, $, _) ->

  class Controllers.Application extends Marionette.Controller

    constructor: (options={}) ->
      @region = options.region or App.request "default:region"
      super options

    show: (view) ->
      @listenTo view, "close", @close
      @region.show view
