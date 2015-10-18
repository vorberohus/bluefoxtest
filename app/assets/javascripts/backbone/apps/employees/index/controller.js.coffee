@BF.module "EmployeesApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.Controller extends App.Controllers.Application

    initialize: ->
      employees = App.request 'get:employees:entities'
      App.execute 'when:fetched', employees, =>
        layout = @getLayoutView()
        @listenTo layout, 'show', ->
          list_header_view = @getListHeaderView()
          list_view = @getListView employees
          layout.listHeaderRegion.show list_header_view
          layout.listRegion.show list_view
        @show layout

    getLayoutView: ->
      new Index.Layout

    getListHeaderView: ->
      new Index.ListHeaderView

    getListView: (employees) ->
      new Index.ListView
        collection: employees
