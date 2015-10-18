@BF.module "EmployeesApp", (EmployeesApp, App, Backbone, Marionette, $, _) ->

  class EmployeesApp.Router extends Marionette.AppRouter
    appRoutes:
      'employees':          'index'
      'employees/new':      'new'
      'employees/:id/show': 'show'
      'employees/:id/edit': 'edit'

  API =
    index: ->
      new EmployeesApp.Index.Controller
    
    show: (id) ->
      new EmployeesApp.Show.Controller

    edit: (id) ->
      new EmployeesApp.Edit.Controller id

    new: ->
      new EmployeesApp.New.Controller

  App.addInitializer ->
    new EmployeesApp.Router
      controller: API
