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
      'click button[data-form-button=cancel]': 'form:cancel'

    modelEvents:
      'change:_errors': 'changeErrors'

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

    changeErrors: (model, errors, options) ->
      if @config.errors
        if _.isEmpty(errors) then @removeErrors() else @addErrors errors

    removeErrors: ->
      @$('.error').removeClass('error').find('small').remove()

    addErrors: (errors={}) ->
      for name, array of errors
        @addError name, array[0]

    addError: (name, error) ->
      el = @$("[name='#{name}']")
      sm = $("<small>").addClass('error').text(error)
      el.after(sm).closest(".row").addClass('error')

