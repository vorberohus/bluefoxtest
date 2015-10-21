@BF.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.Action extends App.Actions.BaseAction

    initialize: (options={}) ->
      @content_view = options.view
      @form_layout = @getFormLayout options.config
      @listenTo @form_layout, 'show', @insertContent
      @listenTo @form_layout, 'close', @close
      @listenTo @form_layout, 'form:submit', @formSubmit
      @listenTo @form_layout, 'form:cancel', @formCancel

    formSubmit: ->
      data = Backbone.Syphon.serialize @form_layout
      if @content_view.triggerMethod('form:submit', data) isnt false
        model = @content_view.model
        @processFromSubmit data, model

    formCancel: ->
      @content_view.trigger 'form:cancelled'

    processFromSubmit: (data, model) ->
      model.save data

    onClose: ->
      console.log "onClose", @

    insertContent: ->
      @form_layout.formContentRegion.show @content_view

    getFormLayout: (options={}) ->
      config = @getDefaultConfig _.result @content_view, 'form'
      _.extend config, options

      console.log config.buttons
      buttons = @getButtons config.buttons

      new Form.FormWrapperLayout
        config: config
        model: @content_view.model
        buttons: buttons

    getDefaultConfig: (config={}) ->
      _.defaults config,
        footer: true
        focusFirstInput: true
        errors: true

    getButtons: (buttons={}) ->
      App.request('form:button:entities', buttons, @content_view.model) unless buttons is false

  App.reqres.setHandler 'form:wrapper', (content_view, options={}) ->
    throw new Error "No model found inside form content view" unless content_view.model
    form_controller = new Form.Action
      view: content_view
      config: options

    form_controller.form_layout
