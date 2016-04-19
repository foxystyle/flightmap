var AppControllers = angular.module('AppControllers',[]);

AppControllers.controller('MainCtrl',[
  '$scope','$http',
  function($scope, $http){
    // Departure location
    $scope.selectedDepartureLocation = 'Zagreb, Croatia'; // THIS IS TEMPORARY
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
    };
    // Person count
    limitPersonCount = function(input) {
      if (input.value < 1) input.value = 1;
      if (input.value > 100) input.value = 100;
    }
    $scope.selectedPersonCount = 1
    // Currency
    $http.get('/currencies').then(function(response){
      $scope.availableCurrencies = response.data.currencies
    })
    $scope.selectedCurrency = "HRK"
    // Dates
    $http.get('/dates').then(function(response){
      $scope.years = response.data.years
      $scope.months = []
      for (var i = 0; i < 12; i++) {
        $scope.months.push(response.data.months[i])
      }
    });
    // Budget
    $scope.budget = {
      min: 0,
      max: 10000
    };
    $scope.$watch('budget.min', updateOutput);
    $scope.$watch('budget.max', updateOutput);
    // Flight duration
    $scope.flightDuration = {
      min: 0,
      max: 30
    };
    $scope.$watch('flightDuration.min', updateOutput);
    $scope.$watch('flightDuration.max', updateOutput);
    //
    //
    function updateOutput(){
      $scope.updateOutputData();
    }
    $scope.updateOutputData = function(){
      $scope.matchingData = [];
       $http.get('/tickets').then(function(response){
        $scope.ticketData = response.data.tickets;
        if ($scope.selectedDepartureLocation !== undefined) {
          var departureLocationDigest = $scope.selectedDepartureLocation.split(', ');
          var departureCityDigest = departureLocationDigest[0]; // Returns City name
          var departureCountryDigest = departureLocationDigest[departureLocationDigest.length-1]; // Returns Country name
          if($scope.selectedYear == undefined) $scope.selectedYear = "*"; // sends string "*" to backend which represents "select all"
          if($scope.selectedMonth == undefined) $scope.selectedMonth = "*";
          // No slection object should be updated if deparute location is unset or not set properly
          // Selection object is a object that contains all processed selection data
          $scope.selectionObject = {
            "departure_city" : departureCityDigest,
            "departure_country" : departureCountryDigest,
            "budget_min" : $scope.budget.min,
            "budget_max" : $scope.budget.max,
            "person_count" : $scope.selectedPersonCount,
            "currency" : $scope.selectedCurrency,
            "month" : $scope.selectedMonth,
            "year" : $scope.selectedYear,
            "flight_duration_min" : $scope.flightDuration.min,
            "flight_duration_max" : $scope.flightDuration.max
          };
        }
        //
      });
      //
    };//end method
    //
}]);//end ctrl

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
