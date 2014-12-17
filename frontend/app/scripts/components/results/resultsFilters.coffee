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
