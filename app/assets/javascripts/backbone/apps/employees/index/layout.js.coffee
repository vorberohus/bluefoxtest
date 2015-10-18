@BF.module "EmployeesApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.Layout extends App.Views.LayoutView
    template: 'employees/index/layout'

    regions:
      listHeaderRegion: '#list-header-region'
      listRegion: '#list-region'
