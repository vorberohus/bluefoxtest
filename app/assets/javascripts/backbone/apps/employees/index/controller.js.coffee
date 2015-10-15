@BF.module "EmployeesApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.Controller extends App.Controllers.Application

    initialize: ->
      @layout = @getLayout()
      @show @layout

