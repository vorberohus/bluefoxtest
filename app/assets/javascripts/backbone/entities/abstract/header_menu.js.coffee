@BF.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.HeaderMenuItem extends App.BaseEntities.Model

  class Entities.HeaderMenu extends App.BaseEntities.Collection
    model: Entities.HeaderMenuItem

  API =
    getHeaderMenu: ->
      new Entities.HeaderMenu [
          title: 'Работники'
          url: Routes.employees_path()
        ,
          title: 'Вакансии'
          url: Routes.vacancies_path()
      ]

  App.reqres.setHandler "get:header:menu:entities", ->
    API.getHeaderMenu()

