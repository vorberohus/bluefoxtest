@BF.module 'EmployeesApp.Delete', (Delete, App, Backbone, Marionette, $, _) ->

  class Delete.Action extends App.Actions.BaseAction

    initialize: (model) ->
      model.destroy()

  App.commands.setHandler 'delete:employee', (model) ->
    new Delete.Action model
