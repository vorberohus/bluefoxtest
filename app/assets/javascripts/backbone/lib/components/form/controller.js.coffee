@BF.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.Controller extends App.Controllers.Application

    initialize: (options={}) ->
      @content_view = options.view
      @form_layout = @getFormLayout options.config
      @listenTo @form_layout, 'show', @insertContent
      @listenTo @form_layout, 'close', @close
      @listenTo @form_layout, 'form:submit', @formSubmit

    formSubmit: ->
      data = Backbone.Syphon.serialize @form_layout
      model = @content_view.model
      @processFromSubmit data, model

    processFromSubmit: (data, model) ->
      model.save data

    onClose: ->
      console.log "onClose", @

    insertContent: ->
      @form_layout.formContentRegion.show @content_view

    getFormLayout: (options={}) ->
      config = @getDefaultConfig _.result @content_view, 'form'
      _.extend config, options

      buttons = @getButtons config.buttons

      new Form.FormWrapperLayout
        config: config
        model: @content_view.model
        buttons: buttons

    getDefaultConfig: (config={}) ->
      _.defaults config,
        footer: true
        focusFirstInput: true

    getButtons: (buttons={}) ->
      App.request 'form:button:entities', buttons, @content_view.model unless buttons is false

  App.reqres.setHandler 'form:wrapper', (content_view, options={}) ->
    throw new Error "No model found inside form content view" unless content_view.model
    form_controller = new Form.Controller
      view: content_view
      config: options

    form_controller.form_layout
