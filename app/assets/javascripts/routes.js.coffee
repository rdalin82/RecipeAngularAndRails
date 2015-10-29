app.config(['$routeProvider', ($routeProvider)->
	$routeProvider
		.when('/', 
			templateUrl: 'index.html'
			controller: 'someController'
		)
		.when('/recipes/new', 
			templateUrl: 'new.html'
			controller: 'someOtherController'
		)
])