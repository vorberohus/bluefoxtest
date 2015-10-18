@BF.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Button extends App.BaseEntities.Model

  class Entities.Buttons extends App.BaseEntities.Collection
    model: Entities.Button

  API =
    getFormButtons: (buttons={}, model) ->
      buttons = @getDefaultButtons buttons, model

      array = []
      array.push {type: 'cancel', className: 'button small alert', text: buttons.cancel} unless buttons.cancel is false
      array.push {type: 'primary', className: 'button small primary', text: buttons.primary} unless buttons.primary is false

      array.reverse() if buttons.placement is 'left'

      buttonCollection = new Entities.Buttons array
      buttonCollection.placement = buttons.placement
      buttonCollection

    getDefaultButtons: (buttons={}, model) ->
      _.defaults buttons,
        primary: if model.isNew() then 'Создать' else 'Сохранить'
        cancel: 'Отмена'
        placement: 'right'

  App.reqres.setHandler 'form:button:entities', (buttons={}, model) ->
    API.getFormButtons buttons, model

