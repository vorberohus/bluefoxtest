@BF.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  _remove = Marionette.View::remove

  _.extend Marionette.View::,

    remove: (args...) ->
      console.log "remove", @
      _remove.apply @, args

    templateHelpers: ->

      linkTo: (name, url, options={}) ->
        _.defaults options,
          external: false
          escape: true
          class: ''

        url = '#' + url unless options.external
        "<a href='#{url}' class='#{options.class}'>#{if options.escape then @escape name else name}</a>"

