@BF.module "Utilities", (Utilities, App, Backbone, Marionette, $, _) ->

  _.extend Marionette.Renderer,

    lookups: ["backbone/apps/", "backbone/lib/components/"]

    render: (template, data) ->
      return if template is false
      path = @getTemplate(template)
      throw "Template #{template} not found!" unless path
      path data

    getTemplate: (template) ->
      for lookup in @lookups
        for path in [template, @withTemplate(template)]
          return JST[lookup + path] if JST[lookup + path]

    withTemplate: (string) ->
      array = string.split "/"
      array.splice -1, 0, "templates"
      array.join "/"
