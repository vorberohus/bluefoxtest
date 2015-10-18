@BF.module "EmployeesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Application

    initialize: (id) ->
      employee = App.request 'get:employee:entity', id
      App.execute 'when:fetched', employee, =>
        console.log employee
        layout = @getLayout()
        @listenTo layout, 'show', ->
          employee_view = @getEmployeeView employee
          form_view = App.request 'form:wrapper', employee_view
          layout.formRegion.show form_view
        @show layout

    getLayout: ->
      new Edit.Layout

    getEmployeeView: (employee) ->
      new Edit.EmployeeView
        model: employee
  
  App.reqres.setHandler 'get:edit:view', (model) ->
    new Edit.EmployeeView
      model: model
