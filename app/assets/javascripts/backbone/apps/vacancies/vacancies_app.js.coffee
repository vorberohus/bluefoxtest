@BF.module "VacanciesApp", (VacanciesApp, App, Backbone, Marionette, $, _) ->

  class VacanciesApp.Router extends Marionette.AppRouter
    appRoutes:
      'vacancies':          'index'
      'vacancies/new':      'new'
      'vacancies/:id/edit': 'edit'

  API =
    index: ->
      new VacanciesApp.Index.Action

    new: ->
      new VacanciesApp.New.Action

    edit: (id) ->
      new VacanciesApp.Edit.Action id

  App.addInitializer ->
     new VacanciesApp.Router
      controller: API
