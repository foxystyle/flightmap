var AppControllers = angular.module('AppControllers',[]);

AppControllers.controller('MainCtrl',[
  function(){
}]);

AppControllers.controller('SidebarCtrl', [
  '$scope', '$timeout', '$mdSidenav', '$log', '$http',
  function($scope, $timeout, $mdSidenav, $log, $http){
    $scope.closeNav = function(){
      $mdSidenav('nav').close()
        .then(function(){
          $log.debug("close nav is done");
        });
    };
}]);



AppControllers.controller('DialogCtrl', [
  '$scope', '$mdDialog',
  function($scope, $mdDialog) {
  $scope.openDialog = function() {
    $mdDialog.show(
      $mdDialog.alert()
        .clickOutsideToClose(true)
        .title('Informacija o podacima')
        .textContent('Navedeni podaci su povijesni. flightmap4.me ne preuzimaju odgovornost za njihovo korištenje prilikom donošenja odluke o rezervaciji ili kupnji aviokarte. Cijena aviokarte ovisi o trenutnoj raspoloživosti na pojedinom letu. Finalna cijena aviokarte vidljiva je na trećem koraku rezervacijskog procesa.')
        .ariaLabel('Info dialog')
        .ok('Zatvori')
        .openFrom('#left')
        .closeTo(angular.element(document.querySelector('#left')))
    );
  };
}]);


AppControllers.controller('DepartureLocationCtrl', [
  '$scope','$http',
  function($scope,$http){
    $http.get('/airports').then(function(response){
      $scope.departureLocations = response.data;
      $scope.showSuggestions();
    });
    $scope.showSuggestions = function(){
      $(function() {
        var data = [];
        $.each($scope.departureLocations.airports, function(index, value){
          if ($scope.departureLocations.airports[index].city) {
            data.push($scope.departureLocations.airports[index].city + ", " + $scope.departureLocations.airports[index].country);
          } else {
            $scope.departureLocations.airports[index].country;
          }
        });
        $( "#departure-location" ).autocomplete({
          source: function(request, response) {
            var results = $.ui.autocomplete.filter(data, request.term);
            response(results.slice(0, 20));
          }
        });
      });
    }
}]);


AppControllers.controller('CurrencyCtrl', [
  '$scope','$http',
  function($scope,$http){
    $http.get('/currencies').then(function(response){
      $scope.availableCurrencies = response.data.currencies
    })
  }
]);

AppControllers.controller('PersonCountCtrl', [
  function(){
    limitPersonCount = function(input) {
      if (input.value < 1) input.value = 1;
      if (input.value > 100) input.value = 100;
    }
  }
]);

AppControllers.controller('DateCtrl', [
  '$scope','$http',
  function($scope, $http){
    $http.get('/dates').then(function(response){
      $scope.years = response.data.years
      $scope.months = []
      for (var i = 0; i < 12; i++) {
        $scope.months.push(response.data.months[i].name)
      }
    })
  }
]);
