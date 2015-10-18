@BF.module "EmployeesApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.ListHeaderView extends App.Views.ItemView
    template: 'employees/index/list_header'
    className: 'row list-header'

  class Index.EmployeeView extends App.Views.ItemView
    template: 'employees/index/_employee'
    tagName: 'li'

  class Index.EmptyView extends App.Views.ItemView
    template: 'employees/index/_empty'
    tagName: 'li'

  class Index.ListView extends App.Views.CompositeView
    template: 'employees/index/list'
    tagName: 'ul'
    className: 'list'
    childView: Index.EmployeeView
    emptyView: Index.EmptyView

