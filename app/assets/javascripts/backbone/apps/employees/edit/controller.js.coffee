@BF.module "EmployeesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Application

    initialize: ->
      @layout = @getLayout()
      @show @layout
