angular.module('ui-multiselect', ['template/multiselect.html']);

angular.module("template/multiselect.html", []).run(["$templateCache", function($templateCache) {
  $templateCache.put("template/multiselect.html",
    "<span class=\"multiSelect\">\n" +
    "  <div class=\"dropdown\">\n" +
    "    <button type=\"button\" class=\"btn btn-default\" placeholder=\"digite ou selecione\" ng-click=\"toggleCheckboxes($event); refreshSelectedItems(); refreshButton();\">selecione <i class=\"ficon ficon-down-open\"></i></button>\n" +
    "  </div>\n" +
    "  <div class=\"checkboxLayer\">\n" +
    "    <form action=\"\">\n" +
    "      <div class=\"helperContainer\" ng-if=\"displayHelper('filter') || displayHelper('all') || displayHelper('none') || displayHelper('reset')\">\n" +
    "        <div class=\"line\" style=\"position:relative\" ng-if=\"displayHelper('filter')\">\n" +
    "          <input placeholder=\"Procurar...\" type=\"text\" ng-click=\"select('filter', $event)\" ng-model=\"inputLabel.labelFilter\" ng-change=\"updateFilter(); $scope.getFormElements();\" class=\"form-control\" />\n" +
    "          <button type=\"button\" class=\"clearButton\" ng-click=\"inputLabel.labelFilter=''; updateFilter(); prepareGrouping(); prepareIndex(); select('clear', $event)\">&times;</button>\n" +
    "        </div>\n" +
    "        <div class=\"line first-line btn-group\" ng-if=\"displayHelper('all') || displayHelper('none') || displayHelper('reset')\">\n" +
    "          <div type=\"button\" class=\"btn btn-default\" ng-click=\"select('all', $event);\" ng-if=\"!isDisabled && displayHelper('all')\"><i class=\"ficon ficon-check\"></i>Todos</div>\n" +
    "          <div type=\"button\" class=\"btn btn-default\" ng-click=\"select('none', $event);\" ng-if=\"!isDisabled && displayHelper('none')\"><i class=\"ficon ficon-cancel\"></i>Nenhum</div>\n" +
    "          <div type=\"button\" class=\"btn btn-default\" ng-click=\"select('reset', $event);\" ng-if=\"!isDisabled && displayHelper('reset')\"><i class=\"ficon ficon-ccw\"></i>Recomeçar</div>\n" +
    "        </div>\n" +
    "      </div>\n" +
    "      <div class=\"checkBoxContainer\" style=\"{{ setHeight(); }}\">\n" +
    "        <div ng-repeat=\"item in filteredModel | filter:removeGroupEndMarker\" class=\"multiSelectItem\" ng-class=\"{ selected: item[tickProperty], horizontal: orientationH, vertical: orientationV, multiSelectGroup:item[groupProperty], disabled:itemIsDisabled(item) }\" ng-click=\"syncItems(item, $event, $index);\" ng-mouseleave=\"removeFocusStyle(tabIndex);\">\n" +
    "          <div class=\"acol\" ng-if=\"item[spacingProperty] > 0\" ng-repeat=\"i in numberToArray(item[spacingProperty]) track by $index\"></div>\n" +
    "          <div class=\"acol\">\n" +
    "            <label>\n" +
    "              <input class=\"checkbox focusable\" type=\"checkbox\" ng-disabled=\"itemIsDisabled(item)\" ng-checked=\"item[tickProperty]\" ng-click=\"syncItems(item, $event, $index)\" />\n" +
    "              <span ng-class=\"{ disabled:itemIsDisabled(item) }\" ng-bind-html=\"writeLabel(item, 'itemLabel')\"></span>\n" +
    "            </label>\n" +
    "          </div>\n" +
    "          <span class=\"tickMark\" ng-if=\"item[groupProperty] !== true && item[tickProperty] === true\"><i class=\"ficon ficon-check\"></i></span>\n" +
    "        </div>\n" +
    "      </div>\n" +
    "    </form>\n" +
    "  </div>\n" +
    "  <span ng-bind-html=\"varButtonLabel\" class=\"filter-results\"></span>\n" +
    "</span>\n" +
    "");
}]);
