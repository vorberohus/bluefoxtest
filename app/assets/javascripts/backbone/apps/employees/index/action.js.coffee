@BF.module "EmployeesApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.Action extends App.Actions.BaseAction

    initialize: ->
      employees = App.request 'get:employees:entities'
      App.execute 'when:fetched', employees, =>
        layout = @getLayoutView()
        @listenTo layout, 'show', ->
          list_header_view = @getListHeaderView employees
          list_view = @getListView employees
          
          @listenTo list_view, 'delete:button:click', (view, args) ->
            App.execute 'delete:employee', args.model

          layout.listHeaderRegion.show list_header_view
          layout.listRegion.show list_view
        @show layout

    getLayoutView: ->
      new Index.Layout

    getListHeaderView: (employees) ->
      new Index.ListHeaderView
        collection: employees

    getListView: (employees) ->
      new Index.ListView
        collection: employees
