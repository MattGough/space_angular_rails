space = angular.module('space',[
  'templates',
  'ngRoute',
  'controllers',
])

space.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'SpacesController'
      )
])

spaces = [
  {
    id: 1
    name: 'Makers'
  },
  {
    id: 2
    name: 'The O2',
  },
  {
    id: 3
    name: 'Big Ben',
  },
  {
    id: 4
    name: 'Barbican',
  },
]
controllers = angular.module('controllers',[])
controllers.controller("SpacesController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.spaces = spaces.filter (space)-> space.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.spaces = []
])
