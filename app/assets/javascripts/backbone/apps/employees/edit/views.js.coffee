@BF.module "EmployeesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.EmployeeView extends App.Views.ItemView
    template: 'employees/edit/employee'

    form: ->
      buttons:
        placement: 'left'
