(function() {
  "use strict";
  angular.module("app").controller("partnerships", function($scope, $http, $q) {
    $scope.setup = function() {
      $http.get('/api/partnerships').then(function(response) {
        $scope.partnerships = response.data
      })
    }
    window.$scope = $scope;
  })
})();



