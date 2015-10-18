@BF.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.FormWrapperLayout extends App.Views.LayoutView

    initialize: ->
      @setInstancePropertiesFor 'config', 'buttons'

    template: 'form/form'

    tagName: 'form'
    className: 'panel'
    attributes: ->
      'data-type': @getFormDataType()

    regions:
      formContentRegion: '#form-content-region'

    triggers:
      'submit': 'form:submit'

    ui:
      buttonContainer: 'ul.inline-list'

    serializeData: ->
      footer: @config.footer
      buttons: @buttons?.toJSON() ? false

    onShow: ->
      _.defer =>
        @focusFirstInput() if @config.focusFirstInput
        @buttonPlacement() if @buttons

    buttonPlacement: ->
      @ui.buttonContainer.addClass @buttons.placement

    focusFirstInput: ->
      @$(":input:visible:enabled:first").focus()

    getFormDataType: ->
      if @model.isNew() then "new" else "edit"

