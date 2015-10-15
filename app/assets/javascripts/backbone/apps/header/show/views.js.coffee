@BF.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.MenuItemView extends App.Views.ItemView
    template: 'header/show/_menu_item'
    tagName: 'li'

  class Show.MenuView extends App.Views.CompositeView
    template: 'header/show/menu'
    tagName: 'nav'
    className: 'top-bar'
    attributes:
      'data-topbar': ''
      'role': 'navigation'
    childView: Show.MenuItemView
    childViewContainer: 'ul#header-menu'
