do (Backbone) ->
  _sync = Backbone.sync

  Backbone.sync = (method, entity, options={}) ->
    if method in ['create', 'update', 'delete']
      auth_properties = []
      auth_properties[$('meta[name=csrf-param]').attr('content')] = $('meta[name=csrf-token]').attr('content')
      entity.set auth_properties, silent: true

    sync = _sync method, entity, options

    if !entity._fetch and method is "read"
      entity._fetch = sync
