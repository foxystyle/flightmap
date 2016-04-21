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
            data.push($scope.departureLocations.airports[index].city + ", " +
                      $scope.departureLocations.airports[index].code + ", " +
                      $scope.departureLocations.airports[index].country);
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
    $scope.selectedPersonCount = 1; // Initial person count value
    // Currency
    $http.get('/currencies').then(function(response){
      $scope.availableCurrencies = response.data.currencies
    });
    $scope.selectedCurrency = "HRK" // Initial currency value
    // Dates
    $http.get('/dates').then(function(response){
      $scope.years = response.data.years
      $scope.months = []
      for (var i = 0; i < response.data.months.length; i++) {
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
      $(".jqvmap-region").css('fill','rgb(140, 150, 170)');
      $scope.outputData = [];
      // If departure date is selected
      //
      if ($scope.selectedDepartureLocation !== undefined) {
        var departureLocationDigest = $scope.selectedDepartureLocation.split(', ');
        var departureCityDigest = departureLocationDigest[0]; // Returns City name
        var departureCountryDigest = departureLocationDigest[departureLocationDigest.length-1]; // Returns Country name
        //if($scope.selectedYear == undefined) $scope.selectedYear = "*"; // sends string "*" to backend which represents "select all"
        //if($scope.selectedMonth == undefined || $scope.selectedMonth.no == undefined) $scope.selectedMonth = "*";
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
        //
        $http.get('/tickets').then(function(response){
          for (var i = 0; i < response.data.tickets.length; i++) {
            // First check if departure city from object matches departure city from selection
            if(response.data.tickets[i].departure_city == departureCityDigest){

              // See if it matches budget range
              if(
                  (response.data.tickets[i].paid_amount_converted * $scope.selectedPersonCount) < $scope.budget.max &&
                  (response.data.tickets[i].paid_amount_converted * $scope.selectedPersonCount) > $scope.budget.min
                ) {

                  // See if it matches flight duration range
                  if(
                    response.data.tickets[i].flight_duration < $scope.flightDuration.max &&
                    response.data.tickets[i].flight_duration > $scope.flightDuration.min
                  ){

                    // Check if date is selected
                    if($scope.selectedMonth == undefined || $scope.selectedYear == undefined) {
                      $scope.outputData.push(response.data.tickets[i].destination_country_tag);
                    } else {
                      if (response.data.tickets[i].departure_date.slice(0,7) == $scope.selectedYear+"-"+$scope.selectedMonth.no) {
                        $scope.outputData.push(response.data.tickets[i].destination_country_tag);
                      }
                    }

                   } // end if flight duration range
                  } // end if budget range
////////////////////////////////////////////////////////////////////
            }// end if - departure city check
          } // end for
          for (var i = 0; i < $scope.outputData.length; i++) {
            $("#jqvmap1_"+$scope.outputData[i].toLowerCase()).css('fill','#283593');
          }
        }); // end func(get-response)
      } //end if
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
        .title('Podaci')
        .textContent('Trenutno jedino podrzano mjesto polaska je Zagreb.')
        .ariaLabel('Info dialog')
        .ok('Zatvori')
        .openFrom('#left')
        .closeTo(angular.element(document.querySelector('#left')))
    );
  };
}]);
