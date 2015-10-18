@BF.module "EmployeesApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Layout extends App.Views.LayoutView
    template: 'employees/new/layout'

    regions:
      newEmployeeRegion: '#new-employee-region'
