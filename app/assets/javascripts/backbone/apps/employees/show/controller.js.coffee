@BF.module "EmployeesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Application

    initialize: ->
      @layout = @getLayout()
      @show @layout
