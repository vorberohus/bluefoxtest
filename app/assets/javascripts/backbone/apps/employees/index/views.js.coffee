@BF.module "EmployeesApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.ListHeaderView extends App.Views.ItemView
    template: 'employees/index/list_header'
    className: 'row list-header'

    collectionEvents:
      'reset update': 'render'

  class Index.EmptyView extends App.Views.ItemView
    template: 'employees/index/_empty'
    tagName: 'li'

  class Index.EmployeeView extends App.Views.ItemView
    template: 'employees/index/_employee'
    tagName: 'li'

    triggers:
      'click button[data-button-role=delete]':'delete:button:click'


  class Index.ListView extends App.Views.CompositeView
    template: 'employees/index/list'
    tagName: 'ul'
    className: 'list'
    childView: Index.EmployeeView
    emptyView: Index.EmptyView

    childEvents:
      'delete:button:click': (view, args) -> @trigger 'delete:button:click', view, args
