describe "RecipeController", ->
	scope 	= null
	ctrl 		= null
	location = null
	routeParmas = null
	resource = null 
	httpBackend = null

	setupController =(keywords, results)->
		inject(($location, $routeParams, $rootScope, $resource, $httpBackend, $controller) ->
			scope 		= $rootScope.$new()
			location 	= $location
			resource	= $resource
			routeParams = $routeParams
			routeParams.keywords = keywords
			# capture the injected service
			httpBackend = $httpBackend

			if results
				request = new RegExp('\/items.*keywords=#{keywords}')
				httpBackend.expectGET(request).respond(results)

			ctrl 	= $controller('RecipesController', 
													$scope: scope
													$location: location)
		)

describe 'controller initialization', ->
	describe 'when no keywords present', ->
		beforeEach(module('receta'))
		beforeEach(setupController())

		afterEach ->
			httpBackend.verifyNoOutstandingExpectation()
			httpBackend.verifyNoOutstandingRequest()

		it 'defaults to no recipes', ->
			expect(scope.recipes).toEqualData([])