@BF.module "BaseEntities", (BaseEntities, App, Backbone, Marionette, $, _) ->

  class BaseEntities.Model extends Backbone.Model

    save: (data, options={}) ->
      is_new = @isNew()

      _.defaults options,
        wait: true
        success: _.bind(@saveSuccess, @, is_new)
        error: _.bind(@saveError, @)

      @unset '_errors'
      super data, options

    saveSuccess: (is_new) =>
      if is_new
        @trigger 'created', @
      else
        @trigger 'updated', @

    saveError: (model, xhr, options={}) =>
      @set _errors: $.parseJSON(xhr.responseText)?.errors unless xhr.status is 500 or xhr.status is 404
