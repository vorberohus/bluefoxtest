@BF.module "EmployeesApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Action extends App.Actions.BaseAction

    initialize: ->
      layout = @getLayoutView()
      @listenTo layout, 'show', ->
        employee = App.request 'new:employee:entity'

        @listenTo employee, 'created', ->
          App.execute 'info:alert', 'aaa'
          App.navigate Routes.employees_path(), trigger: true

        @listenTo employee, 'error', ->
          console.log 'error', employee

        edit_view = App.request 'get:edit:view', employee

        @listenTo edit_view, 'form:cancelled', ->
          App.navigate Routes.employees_path(), trigger: true
        form_view = App.request 'form:wrapper', edit_view

        layout.newEmployeeRegion.show form_view

      @show layout

    getLayoutView: ->
      new New.Layout
