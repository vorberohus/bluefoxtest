@BF.module "EmployeesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Action extends App.Actions.BaseAction

    initialize: (id) ->
      employee = App.request 'get:employee:entity', id
      
      @listenTo employee, 'updated', ->
        App.navigate Routes.employees_path(), trigger: true

      App.execute 'when:fetched', employee, =>
        layout = @getLayout()
        @listenTo layout, 'show', ->
          employee_view = @getEmployeeView employee
          @listenTo employee_view, 'form:cancelled', ->
            App.navigate Routes.employees_path(), trigger: true
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
