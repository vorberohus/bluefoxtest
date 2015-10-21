@BF.module "EmployeesApp", (EmployeesApp, App, Backbone, Marionette, $, _) ->

  class EmployeesApp.Router extends Marionette.AppRouter
    appRoutes:
      'employees':          'index'
      'employees/new':      'new'
      'employees/:id/show': 'show'
      'employees/:id/edit': 'edit'

  API =
    index: ->
      new EmployeesApp.Index.Action

    new: ->
      new EmployeesApp.New.Action
    
    show: (id) ->
      new EmployeesApp.Show.Action id

    edit: (id) ->
      new EmployeesApp.Edit.Action id


  App.addInitializer ->
    new EmployeesApp.Router
      controller: API
