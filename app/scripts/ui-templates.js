angular.module('ui-templates', ['template/accordion/accordion-group.html']);

angular.module("template/accordion/accordion-group.html", []).run(["$templateCache", function($templateCache) {
  $templateCache.put("template/accordion/accordion-group.html",
    "<div class=\"panel panel-default\">\n" +
    "  <div class=\"panel-heading\" ng-click=\"toggleOpen()\">\n" +
    "    <h4 class=\"panel-title\">\n" +
    "      <a href=\"\" class=\"accordion-toggle\" accordion-transclude=\"heading\">\n" +
    "        <span ng-class=\"{'text-muted': isDisabled}\">{{heading}}</span>\n" +
    "      </a>\n" +
    "    </h4>\n" +
    "  </div>\n" +
    "  <div class=\"panel-collapse\" collapse=\"!isOpen\" ng-transclude>\n" +
    "  </div>\n" +
    "</div>\n" +
    "");
}]);
