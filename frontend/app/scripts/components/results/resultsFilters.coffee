'use strict'

# Inputs a number and outputs an array with that length.
# (3 | array) => [0,1,2]
app.filter 'returnArray', ->
  (arrayLength) ->
    arrayLength = Math.ceil(arrayLength)
    arr = new Array(arrayLength)
    i = 0
    while i < arrayLength
      arr[i] = i
      i++

    arr

app.filter "priceBetween", ->
  (items, min, max) ->
    return items if min == 'all'
    filtered = []
    type = ''
    if min
      if min.indexOf(',') > -1
        max = min.split(',')[1]
        min = min.split(',')[0]
      if min.indexOf('-') > -1
        min = min.split('-')[0]
        type = 'until'
      if min.indexOf('+') > -1
        min = min.split('+')[0]
        type = 'over'
    else
      min = parseFloat(min)
      max = parseFloat(max)

    if (typeof max isnt 'undefined') or (max is 0)
      angular.forEach items, (item, key) ->
        filtered.push item  if item.price <= max and item.price >= min
        return
    else
      if type == 'until'
        angular.forEach items, (item, key) ->
          filtered.push item  if item.price <= min
          return
      if type == 'over'
        angular.forEach items, (item, key) ->
          filtered.push item  if item.price >= min
          return

    filtered
