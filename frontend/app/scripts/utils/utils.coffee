'use strict'

###*
 # @ngdoc object
 # @name MarketplaceApp.app:helpers
 # @description
 # # helpers
 # Helpers of the MarketplaceApp
###
root = exports ? this
root.app.helpers =
  ###*
   # @ngdoc function
   # @name MarketplaceApp.app.helpers:output
   # @description
   # # helpers
   # Output helps you print json data with code coloring
  ###
  output: (json, withSyntaxHighlight = true) ->
    if withSyntaxHighlight?
      json = JSON.stringify(json, 'undefined', 2)
    else
      return JSON.stringify(json, 'undefined', 2)

    json = json.replace(/&/g, '&').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    # Ignore max_line_length because of regular expression
    # coffeelint: disable=max_line_length
    result = json.replace /("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, (match) ->
      cls = 'number'
      if /^"/.test(match)
        if /:$/.test(match)
          cls = 'key'
        else
          cls = 'string'
      else if /true|false/.test(match)
        cls = 'boolean'
      else cls = 'null'  if /null/.test(match)
      '<span class="' + cls + '">' + match + '</span>'

    # Re-enable it
    # coffeelint: enable=max_line_length
    result
