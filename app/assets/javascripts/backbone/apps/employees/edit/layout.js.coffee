@BF.module "EmployeesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Layout extends App.Views.LayoutView
    template: 'employees/edit/layout'

    regions:
      formRegion: '#form-region'
