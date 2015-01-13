#
# * Angular JS Multi Select
# * Creates a dropdown-like button with checkboxes.
# *
# * Project started on: Tue, 14 Jan 2014 - 5:18:02 PM
# * Current version: 2.0.2
# *
# * Released under the MIT License
# * --------------------------------------------------------------------------------
# * The MIT License (MIT)
# *
# * Copyright (c) 2014 Ignatius Steven (https://github.com/isteven)
# *
# * Permission is hereby granted, free of charge, to any person obtaining a copy
# * of this software and associated documentation files (the "Software"), to deal
# * in the Software without restriction, including without limitation the rights
# * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# * copies of the Software, and to permit persons to whom the Software is
# * furnished to do so, subject to the following conditions:
# *
# * The above copyright notice and this permission notice shall be included in all
# * copies or substantial portions of the Software.
# *
# * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# * SOFTWARE.
# * --------------------------------------------------------------------------------
#
# coffeelint: disable=max_line_length
angular.module("multi-select", ["ng"]).directive "multiSelect", [
  "$sce"
  "$timeout"
  ($sce, $timeout) ->
    return (
      restrict: "AE"
      replace: true
      scope:

        # models
        inputModel: "="
        outputModel: "="

        # settings based on attribute
        buttonLabel: "@"
        defaultLabel: "@"
        directiveId: "@"
        helperElements: "@"
        isDisabled: "="
        itemLabel: "@"
        maxLabels: "@"
        orientation: "@"
        selectionMode: "@"

        # settings based on input model property
        tickProperty: "@"
        disableProperty: "@"
        groupProperty: "@"
        maxHeight: "@"

        # callbacks
        onClose: "&"
        onItemClick: "&"
        onOpen: "&"

      templateUrl: "template/multiselect.html"
      link: ($scope, element, attrs) ->
        $scope.backUp = []
        $scope.varButtonLabel = ""
        $scope.scrolled = false
        $scope.spacingProperty = ""
        $scope.indexProperty = ""
        $scope.checkBoxLayer = ""
        $scope.orientationH = false
        $scope.orientationV = true
        $scope.filteredModel = []
        $scope.inputLabel = labelFilter: ""
        $scope.selectedItems = []
        $scope.formElements = []
        $scope.tabIndex = 0
        $scope.clickedItem = null
        prevTabIndex = 0
        helperItems = []
        helperItemsLength = 0

        # If user specify a height, call this function
        $scope.setHeight = ->
          "max-height: " + $scope.maxHeight + "; overflow-y:scroll"  if typeof $scope.maxHeight isnt "undefined"


        # A little hack so that AngularJS ng-repeat can loop using start and end index like a normal loop
        # http://stackoverflow.com/questions/16824853/way-to-ng-repeat-defined-number-of-times-instead-of-repeating-over-array
        $scope.numberToArray = (num) ->
          new Array(num)

        $scope.updateFilter = ->

          # we check by looping from end of array
          $scope.filteredModel = []
          i = 0
          return []  if typeof $scope.inputModel is "undefined"
          i = $scope.inputModel.length - 1
          while i >= 0

            # if it's group end
            $scope.filteredModel.push $scope.inputModel[i]  if typeof $scope.inputModel[i][$scope.groupProperty] isnt "undefined" and $scope.inputModel[i][$scope.groupProperty] is false

            # if it's data
            gotData = false
            if typeof $scope.inputModel[i][$scope.groupProperty] is "undefined"
              for key of $scope.inputModel[i]

                # if filter string is in one of object property
                if typeof $scope.inputModel[i][key] isnt "boolean" and String($scope.inputModel[i][key]).toUpperCase().indexOf($scope.inputLabel.labelFilter.toUpperCase()) >= 0
                  gotData = true
                  break

              # push
              $scope.filteredModel.push $scope.inputModel[i]  if gotData is true

            # if it's group start
            if typeof $scope.inputModel[i][$scope.groupProperty] isnt "undefined" and $scope.inputModel[i][$scope.groupProperty] is true
              if typeof $scope.filteredModel[$scope.filteredModel.length - 1][$scope.groupProperty] isnt "undefined" and $scope.filteredModel[$scope.filteredModel.length - 1][$scope.groupProperty] is false
                $scope.filteredModel.pop()
              else
                $scope.filteredModel.push $scope.inputModel[i]
            i--
          $scope.filteredModel.reverse()
          $timeout (->
            $scope.getFormElements()
            return
          ), 0
          return


        # List all the input elements.
        # This function will be called everytime the filter is updated. Not good for performance, but oh well..
        $scope.getFormElements = ->
          $scope.formElements = []
          i = 0

          while i < element[0].getElementsByTagName("FORM")[0].elements.length
            $scope.formElements.push element[0].getElementsByTagName("FORM")[0].elements[i]
            i++
          return


        # check if an item has $scope.groupProperty (be it true or false)
        $scope.isGroupMarker = (item, type) ->
          return true  if typeof item[$scope.groupProperty] isnt "undefined" and item[$scope.groupProperty] is type
          false

        $scope.removeGroupEndMarker = (item) ->
          return false  if typeof item[$scope.groupProperty] isnt "undefined" and item[$scope.groupProperty] is false
          true


        # Show or hide a helper element
        $scope.displayHelper = (elementString) ->
          if attrs.selectionMode and $scope.selectionMode.toUpperCase() is "SINGLE"
            switch elementString.toUpperCase()
              when "ALL"
                return false
              when "NONE"
                return false
              when "RESET"
                if typeof attrs.helperElements is "undefined"
                  return true
                else return true  if attrs.helperElements and $scope.helperElements.toUpperCase().indexOf("RESET") >= 0
              when "FILTER"
                return true  if typeof attrs.helperElements is "undefined"
                return true  if attrs.helperElements and $scope.helperElements.toUpperCase().indexOf("FILTER") >= 0
              else
            false
          else
            return true  if typeof attrs.helperElements is "undefined"
            return true  if attrs.helperElements and $scope.helperElements.toUpperCase().indexOf(elementString.toUpperCase()) >= 0
            false


        # call this function when an item is clicked
        $scope.syncItems = (item, e, ng_repeat_index) ->
          e.preventDefault()
          e.stopPropagation()

          # if it's globaly disabled, then don't do anything
          return false  if typeof attrs.disableProperty isnt "undefined" and item[$scope.disableProperty] is true

          # don't change disabled items
          return false  if typeof attrs.isDisabled isnt "undefined" and $scope.isDisabled is true

          # we don't care about end of group markers
          return false  if typeof item[$scope.groupProperty] isnt "undefined" and item[$scope.groupProperty] is false
          index = $scope.filteredModel.indexOf(item)

          # process items if the start of group marker is clicked ( only for multiple selection! )
          # if, in a group, there are items which are not selected, then they all will be selected
          # if, in a group, all items are selected, then they all will be de-selected
          if typeof item[$scope.groupProperty] isnt "undefined" and item[$scope.groupProperty] is true
            return false  if attrs.selectionMode and $scope.selectionMode.toUpperCase() is "SINGLE"
            i = undefined
            j = undefined
            k = undefined
            startIndex = 0
            endIndex = $scope.filteredModel.length - 1
            tempArr = []
            nestLevel = 0
            i = index
            while i < $scope.filteredModel.length
              break  if nestLevel is 0 and i > index

              # if group start
              if typeof $scope.filteredModel[i][$scope.groupProperty] isnt "undefined" and $scope.filteredModel[i][$scope.groupProperty] is true

                # To cater multi level grouping
                startIndex = i + 1  if tempArr.length is 0
                nestLevel = nestLevel + 1

              # if group end
              else if typeof $scope.filteredModel[i][$scope.groupProperty] isnt "undefined" and $scope.filteredModel[i][$scope.groupProperty] is false
                nestLevel = nestLevel - 1

                # cek if all are ticked or not
                if tempArr.length > 0 and nestLevel is 0
                  allTicked = true
                  endIndex = i
                  j = 0
                  while j < tempArr.length
                    if typeof tempArr[j][$scope.tickProperty] isnt "undefined" and tempArr[j][$scope.tickProperty] is false
                      allTicked = false
                      break
                    j++
                  if allTicked is true
                    j = startIndex
                    while j <= endIndex
                      if typeof $scope.filteredModel[j][$scope.groupProperty] is "undefined"
                        if typeof attrs.disableProperty is "undefined"
                          $scope.filteredModel[j][$scope.tickProperty] = false

                          # we refresh input model as well
                          inputModelIndex = $scope.filteredModel[j][$scope.indexProperty]
                          $scope.inputModel[inputModelIndex][$scope.tickProperty] = false
                        else if $scope.filteredModel[j][$scope.disableProperty] isnt true
                          $scope.filteredModel[j][$scope.tickProperty] = false

                          # we refresh input model as well
                          inputModelIndex = $scope.filteredModel[j][$scope.indexProperty]
                          $scope.inputModel[inputModelIndex][$scope.tickProperty] = false
                      j++
                  else
                    j = startIndex
                    while j <= endIndex
                      if typeof $scope.filteredModel[j][$scope.groupProperty] is "undefined"
                        if typeof attrs.disableProperty is "undefined"
                          $scope.filteredModel[j][$scope.tickProperty] = true

                          # we refresh input model as well
                          inputModelIndex = $scope.filteredModel[j][$scope.indexProperty]
                          $scope.inputModel[inputModelIndex][$scope.tickProperty] = true
                        else if $scope.filteredModel[j][$scope.disableProperty] isnt true
                          $scope.filteredModel[j][$scope.tickProperty] = true

                          # we refresh input model as well
                          inputModelIndex = $scope.filteredModel[j][$scope.indexProperty]
                          $scope.inputModel[inputModelIndex][$scope.tickProperty] = true
                      j++

              # if data
              else
                tempArr.push $scope.filteredModel[i]
              i++

          # single item click
          else

            # If it's single selection mode
            if attrs.selectionMode and $scope.selectionMode.toUpperCase() is "SINGLE"

              # first, set everything to false
              i = 0
              while i < $scope.filteredModel.length
                $scope.filteredModel[i][$scope.tickProperty] = false
                i++
              i = 0
              while i < $scope.inputModel.length
                $scope.inputModel[i][$scope.tickProperty] = false
                i++

              # then set the clicked item to true
              $scope.filteredModel[index][$scope.tickProperty] = true
              $scope.toggleCheckboxes e

            # Multiple
            else
              $scope.filteredModel[index][$scope.tickProperty] = not $scope.filteredModel[index][$scope.tickProperty]

            # we refresh input model as well
            inputModelIndex = $scope.filteredModel[index][$scope.indexProperty]
            $scope.inputModel[inputModelIndex][$scope.tickProperty] = $scope.filteredModel[index][$scope.tickProperty]
          $scope.clickedItem = angular.copy(item)

          # We update the index here
          prevTabIndex = $scope.tabIndex
          $scope.tabIndex = ng_repeat_index + helperItemsLength

          # Set focus on the hidden checkbox
          e.target.focus()

          # set & remove CSS style
          $scope.removeFocusStyle prevTabIndex
          $scope.setFocusStyle $scope.tabIndex
          return


        # update $scope.selectedItems
        # this variable is used in $scope.outputModel and to refresh the button label
        $scope.refreshSelectedItems = ->
          $scope.selectedItems = []
          angular.forEach $scope.inputModel, (value, key) ->
            $scope.selectedItems.push value  if value[$scope.tickProperty] is true  if typeof value[$scope.groupProperty] is "undefined"  if typeof value isnt "undefined"
            return

          return


        # refresh output model as well
        $scope.refreshOutputModel = ->
          if typeof attrs.outputModel isnt "undefined"
            $scope.outputModel = angular.copy($scope.selectedItems)
            angular.forEach $scope.outputModel, (value, key) ->

              # remove the index number and spacing number from output model
              delete value[$scope.indexProperty]

              delete value[$scope.spacingProperty]

              return

          return


        # refresh button label
        $scope.refreshButton = ->
          $scope.varButtonLabel = ""
          ctr = 0

          # refresh button label...
          if $scope.selectedItems.length is 0

            # https://github.com/isteven/angular-multi-select/pull/19
            $scope.varButtonLabel = (if (typeof $scope.defaultLabel isnt "undefined") then $scope.defaultLabel else "Nenhum selecionado")
          else
            tempMaxLabels = $scope.selectedItems.length
            tempMaxLabels = $scope.maxLabels  if typeof $scope.maxLabels isnt "undefined" and $scope.maxLabels isnt ""

            # if max amount of labels displayed..
            if $scope.selectedItems.length > tempMaxLabels
              $scope.more = true
            else
              $scope.more = false
            angular.forEach $scope.selectedItems, (value, key) ->
              if typeof value isnt "undefined"
                $scope.varButtonLabel += ((if $scope.varButtonLabel.length > 0 then "</span> <span class=\"label label-info\">" else "<span class=\"label label-info\">")) + $scope.writeLabel(value, "buttonLabel")  if ctr < tempMaxLabels
                ctr++
              return

            if $scope.more is true

              # https://github.com/isteven/angular-multi-select/pull/16
              # $scope.varButtonLabel += ", ... "  if tempMaxLabels > 0
              $scope.varButtonLabel += "(Total: " + $scope.selectedItems.length + ")"
          $scope.varButtonLabel = $sce.trustAsHtml($scope.varButtonLabel)
          return


        # Check if a checkbox is disabled or enabled. It will check the granular control (disableProperty) and global control (isDisabled)
        # Take note that the granular control has higher priority.
        $scope.itemIsDisabled = (item) ->
          if typeof attrs.disableProperty isnt "undefined" and item[$scope.disableProperty] is true
            true
          else
            if $scope.isDisabled is true
              true
            else
              false


        # A simple function to parse the item label settings
        $scope.writeLabel = (item, type) ->
          label = ""
          temp = $scope[type].split(" ")
          angular.forEach temp, (value2, key2) ->
            if typeof value2 isnt "undefined"
              angular.forEach item, (value1, key1) ->
                label += "&nbsp;" + value1  if key1 is value2
                return

            return

          return label  if type.toUpperCase() is "BUTTONLABEL"
          $sce.trustAsHtml label


        # UI operations to show/hide checkboxes based on click event..
        $scope.toggleCheckboxes = (e) ->

          # We grab the checkboxLayer
          $scope.checkBoxLayer = element.children()[1]

          # We grab the button
          clickedEl = element.children()[0]

          # Just to make sure.. had a bug where key events were recorded twice
          angular.element(document).unbind "click", $scope.externalClickListener
          angular.element(document).unbind "keydown", $scope.keyboardListener

          # clear filter
          $scope.inputLabel.labelFilter = ""
          $scope.updateFilter()

          # close if ESC key is pressed.
          if e.keyCode is 27
            angular.element($scope.checkBoxLayer).removeClass "show"
            angular.element(clickedEl).removeClass "buttonClicked"
            angular.element(document).unbind "click", $scope.externalClickListener
            angular.element(document).unbind "keydown", $scope.keyboardListener

            # clear the focused element;
            $scope.removeFocusStyle $scope.tabIndex

            # close callback
            $scope.onClose data: element
            return true

          # The idea below was taken from another multi-select directive - https://github.com/amitava82/angular-multiselect
          # His version is awesome if you need a more simple multi-select approach.

          # close
          if angular.element($scope.checkBoxLayer).hasClass("show")
            angular.element($scope.checkBoxLayer).removeClass "show"
            angular.element(clickedEl).removeClass "buttonClicked"
            angular.element(document).unbind "click", $scope.externalClickListener
            angular.element(document).unbind "keydown", $scope.keyboardListener

            # clear the focused element;
            $scope.removeFocusStyle $scope.tabIndex

            # close callback
            $scope.onClose data: element

          # open
          else
            helperItems = []
            helperItemsLength = 0
            angular.element($scope.checkBoxLayer).addClass "show"
            angular.element(clickedEl).addClass "buttonClicked"
            angular.element(document).bind "click", $scope.externalClickListener
            angular.element(document).bind "keydown", $scope.keyboardListener

            # to get the initial tab index, depending on how many helper elements we have.
            # priority is to always focus it on the input filter
            $scope.getFormElements()
            $scope.tabIndex = 0
            helperContainer = angular.element(element[0].querySelector(".helperContainer"))[0]
            if typeof helperContainer isnt "undefined"
              i = 0
              while i < helperContainer.getElementsByTagName("BUTTON").length
                helperItems[i] = helperContainer.getElementsByTagName("BUTTON")[i]
                i++
              helperItemsLength = helperItems.length + helperContainer.getElementsByTagName("INPUT").length

            # focus on the filter element on open.
            if element[0].querySelector(".inputFilter")
              element[0].querySelector(".inputFilter").focus()
              $scope.tabIndex = $scope.tabIndex + helperItemsLength - 2

            # if there's no filter then just focus on the first checkbox item
            else
              $scope.formElements[$scope.tabIndex].focus()

            # open callback
            $scope.onOpen data: element
          return


        # handle clicks outside the button / multi select layer
        $scope.externalClickListener = (e) ->
          targetsArr = element.find(e.target.tagName)
          i = 0

          while i < targetsArr.length
            return  if e.target is targetsArr[i]
            i++
          angular.element($scope.checkBoxLayer.previousSibling).removeClass "buttonClicked"
          angular.element($scope.checkBoxLayer).removeClass "show"
          angular.element(document).unbind "click", $scope.externalClickListener
          angular.element(document).unbind "keydown", $scope.keyboardListener

          # close callback
          $timeout (->
            $scope.onClose data: element
            return
          ), 0
          return


        # traverse up to find the button tag
        # http://stackoverflow.com/questions/7332179/how-to-recursively-search-all-parentnodes
        $scope.findUpTag = (el, tag, className) ->
          while el.parentNode
            el = el.parentNode
            return el  if el.tagName.toUpperCase() is tag.toUpperCase() and el.className.indexOf(className) > -1  if typeof el.tagName isnt "undefined"
          null


        # select All / select None / reset buttons
        $scope.select = (type, e) ->
          helperIndex = helperItems.indexOf(e.target)
          $scope.tabIndex = helperIndex
          switch type.toUpperCase()
            when "ALL"
              angular.forEach $scope.filteredModel, (value, key) ->
                value[$scope.tickProperty] = true  if typeof value[$scope.groupProperty] is "undefined"  if typeof value isnt "undefined" and value[$scope.disableProperty] isnt true
                return

            when "NONE"
              angular.forEach $scope.filteredModel, (value, key) ->
                value[$scope.tickProperty] = false  if typeof value[$scope.groupProperty] is "undefined"  if typeof value isnt "undefined" and value[$scope.disableProperty] isnt true
                return

            when "RESET"
              angular.forEach $scope.filteredModel, (value, key) ->
                if typeof value[$scope.groupProperty] is "undefined" and typeof value isnt "undefined" and value[$scope.disableProperty] isnt true
                  temp = value[$scope.indexProperty]
                  value[$scope.tickProperty] = $scope.backUp[temp][$scope.tickProperty]
                return

            when "CLEAR"
              $scope.tabIndex = $scope.tabIndex + 1
            when "FILTER"
              $scope.tabIndex = helperItems.length - 1
            else


        # just to create a random variable name
        genRandomString = (length) ->
          possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
          temp = ""
          i = 0

          while i < length
            temp += possible.charAt(Math.floor(Math.random() * possible.length))
            i++
          temp


        # count leading spaces
        $scope.prepareGrouping = ->
          spacing = 0
          angular.forEach $scope.filteredModel, (value, key) ->
            value[$scope.spacingProperty] = spacing
            if value[$scope.groupProperty] is true
              spacing += 2
            else spacing -= 2  if value[$scope.groupProperty] is false
            return

          return


        # prepare original index
        $scope.prepareIndex = ->
          ctr = 0
          angular.forEach $scope.filteredModel, (value, key) ->
            value[$scope.indexProperty] = ctr
            ctr++
            return

          return


        # navigate using up and down arrow
        $scope.keyboardListener = (e) ->
          key = (if e.keyCode then e.keyCode else e.which)
          isNavigationKey = false

          # ESC key (close)
          if key is 27
            $scope.toggleCheckboxes e

          # next element ( tab, down & right key )
          else if key is 40 or key is 39 or (not e.shiftKey and key is 9)
            isNavigationKey = true
            prevTabIndex = $scope.tabIndex
            $scope.tabIndex++
            if $scope.tabIndex > $scope.formElements.length - 1
              $scope.tabIndex = 0
              prevTabIndex = $scope.formElements.length - 1
            while $scope.formElements[$scope.tabIndex].disabled is true
              $scope.tabIndex++
              $scope.tabIndex = 0  if $scope.tabIndex > $scope.formElements.length - 1

          # prev element ( shift+tab, up & left key )
          else if key is 38 or key is 37 or (e.shiftKey and key is 9)
            isNavigationKey = true
            prevTabIndex = $scope.tabIndex
            $scope.tabIndex--
            if $scope.tabIndex < 0
              $scope.tabIndex = $scope.formElements.length - 1
              prevTabIndex = 0
            while $scope.formElements[$scope.tabIndex].disabled is true
              $scope.tabIndex--
              $scope.tabIndex = $scope.formElements.length - 1  if $scope.tabIndex < 0
          if isNavigationKey is true
            e.preventDefault()
            e.stopPropagation()

            # set focus on the checkbox
            $scope.formElements[$scope.tabIndex].focus()

            # css styling
            actEl = document.activeElement
            if actEl.type.toUpperCase() is "CHECKBOX"
              $scope.setFocusStyle $scope.tabIndex
              $scope.removeFocusStyle prevTabIndex
            else
              $scope.removeFocusStyle prevTabIndex
              $scope.removeFocusStyle helperItemsLength
              $scope.removeFocusStyle $scope.formElements.length - 1
          isNavigationKey = false
          return


        # set (add) CSS style on selected row
        $scope.setFocusStyle = (tabIndex) ->
          angular.element($scope.formElements[tabIndex]).parent().parent().parent().addClass "multiSelectFocus"
          return


        # remove CSS style on selected row
        $scope.removeFocusStyle = (tabIndex) ->
          angular.element($scope.formElements[tabIndex]).parent().parent().parent().removeClass "multiSelectFocus"
          return


        #/////////////////////////////////////////////////////
        #
        # Logic starts here, initiated by watch 1 & watch 2.
        #
        #/////////////////////////////////////////////////////
        tempStr = genRandomString(5)
        $scope.indexProperty = "idx_" + tempStr
        $scope.spacingProperty = "spc_" + tempStr

        # set orientation css
        if typeof attrs.orientation isnt "undefined"
          if attrs.orientation.toUpperCase() is "HORIZONTAL"
            $scope.orientationH = true
            $scope.orientationV = false
          else
            $scope.orientationH = false
            $scope.orientationV = true

        # watch1, for changes in input model property
        # updates multi-select when user select/deselect a single checkbox programatically
        # https://github.com/isteven/angular-multi-select/issues/8
        $scope.$watch "inputModel", ((newVal) ->
          if newVal
            $scope.refreshSelectedItems()
            $scope.refreshOutputModel()
            $scope.refreshButton()
            if $scope.clickedItem isnt null
              $timeout (->
                $scope.onItemClick data: $scope.clickedItem
                $scope.clickedItem = null
                return
              ), 0
          return
        ), true

        # watch2 for changes in input model as a whole
        # this on updates the multi-select when a user load a whole new input-model. We also update the $scope.backUp variable
        $scope.$watch "inputModel", (newVal) ->
          if newVal
            $scope.backUp = angular.copy($scope.inputModel)
            $scope.updateFilter()
            $scope.prepareGrouping()
            $scope.prepareIndex()
            $scope.refreshSelectedItems()
            $scope.refreshOutputModel()
            $scope.refreshButton()
          return


        # watch for changes in directive state (disabled or enabled)
        $scope.$watch "isDisabled", (newVal) ->
          $scope.isDisabled = newVal
          return


        # this is for touch enabled devices. We don't want to hide checkboxes on scroll.
        angular.element(document).bind "touchstart", (e) ->
          $scope.$apply ->
            $scope.scrolled = false
            return

          return


        # also for touch enabled devices
        angular.element(document).bind "touchmove", (e) ->
          $scope.$apply ->
            $scope.scrolled = true
            return

          return


        # for IE8, perhaps. Not sure if this is really executed.
        unless Array::indexOf
          Array::indexOf = (what, i) ->
            i = i or 0
            L = @length
            while i < L
              return i  if this[i] is what
              ++i
            -1
        return
    )
]
# coffeelint: enable=max_line_length
