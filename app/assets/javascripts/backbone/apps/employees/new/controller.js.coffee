@BF.module "EmployeesApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: ->
      @layout = @getLayout()
      @show @layout
