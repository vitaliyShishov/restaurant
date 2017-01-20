/**
 * Category page controller
 * @param $scope
 */
angular.module('categoryPage')
    .controller('filterController', ['$scope', 'MainService', function ($scope, MainService) {

        var filterController = this;
        filterController.init = init;

        filterController.productsAmount = MainService.getTotalProducts();
        filterController.filterPrice = 0;
        filterController.filterKcal = 0;
        filterController.filterValues = {};
        filterController.filterCounters = {};

        filterController.initFilterValues = initFilterValues;
        filterController.initFilterCounters = initFilterCounters;
        filterController.changeIngredient = changeIngredient;
        filterController.changeNoneIngredient = changeNoneIngredient;
        filterController.changeAll = changeAllIngridients;
        filterController.changeAllergens = changeAllergens;

        function initFilterValues() {
            filterController.filterValues = {
                'price': 0,
                'kcal': 0,
                'ingredients': [],
                'noneIngredients': [],
                'allergens': []
            };

            MainService.filterProducts(filterController.filterValues);
        }

        function initFilterCounters() {
            filterController.filterCounters = {
                'price': 0,
                'kcal': 0,
                'ingredients': 0,
                'allergens': 0,
                'allergenObject': {}
            };

            MainService.setFilterCounters(filterController.filterCounters);
        }

        (function initFilter() {
            filterController.initFilterValues();
            filterController.initFilterCounters();
        })();

        function init(filters, allergens) {
            filterController.filters = filters;
            filterController.allergens = allergens;
        }

        function watchPrice() {
            return filterController.filterPrice;
        }

        function watchKcal() {
            return filterController.filterKcal;
        }

        function watchTotal() {
            return MainService.getTotalProducts();
        }

        $scope.$watch(watchPrice, function (data, oldData) {
            if (data > 0) {
                filterController.filterCounters.price++;
                filterController.filterValues.price = data;
                MainService.filterProducts(filterController.filterValues);
            }
        });

        $scope.$watch(watchKcal, function (data, oldData) {
            if (data > 0) {
                filterController.filterCounters.kcal++;
                filterController.filterValues.kcal = data;
                MainService.filterProducts(filterController.filterValues);
            }
        });

        $scope.$watch(watchTotal, function (data, oldData) {
            filterController.productsAmount = data;
        });

        function changeIngredient(id) {
            if (filterController.filterValues.ingredients.length > 0) {
                var flag = false;

                for (var k in filterController.filterValues.ingredients) {
                    if (filterController.filterValues.ingredients[k] == id) {
                        flag = k;
                    }
                }

                if (flag) {
                    filterController.filterValues.ingredients.splice(flag, 1);
                } else {
                    filterController.filterValues.ingredients.push(id);
                }

            } else {
                filterController.filterValues.ingredients.push(id);
            }

            if (filterController.filterValues.noneIngredients.length > 0) {
                for (var s in filterController.filterValues.noneIngredients) {
                    if (filterController.filterValues.noneIngredients[s] == id) {
                        filterController.filterValues.noneIngredients.splice(s, 1);
                    }
                }
            }
            filterController.filterCounters.ingredients++;
            MainService.filterProducts(filterController.filterValues);
        }

        function changeNoneIngredient(id) {
            if (filterController.filterValues.noneIngredients.length > 0) {

                var flag = false;

                for (var k in filterController.filterValues.noneIngredients) {
                    if (filterController.filterValues.noneIngredients[k] == id) {
                        flag = k;
                    }
                }

                if (flag) {
                    filterController.filterValues.noneIngredients.splice(flag, 1);
                } else {
                    filterController.filterValues.noneIngredients.push(id);
                }

            } else {
                filterController.filterValues.noneIngredients.push(id);
            }

            if (filterController.filterValues.ingredients.length > 0) {
                for (var s in filterController.filterValues.ingredients) {
                    if (filterController.filterValues.ingredients[s] == id) {
                        filterController.filterValues.ingredients.splice(s, 1);
                    }
                }
            }

            filterController.filterCounters.ingredients++;
            MainService.filterProducts(filterController.filterValues);
        }

        function changeAllIngridients(id) {
            if (filterController.filterValues.ingredients.length > 0) {
                for (var s in filterController.filterValues.ingredients) {
                    if (filterController.filterValues.ingredients[s] == id) {
                        filterController.filterValues.ingredients.splice(s, 1);
                    }
                }
            }

            if (filterController.filterValues.noneIngredients.length > 0) {
                for (var s in filterController.filterValues.noneIngredients) {
                    if (filterController.filterValues.noneIngredients[s] == id) {
                        filterController.filterValues.noneIngredients.splice(s, 1);
                    }
                }
            }

            filterController.filterCounters.ingredients++;
            MainService.filterProducts(filterController.filterValues);
        }

        function changeAllergens(id) {
            if (filterController.filterValues.allergens.length > 0) {
                var flag = false;

                for (var k in filterController.filterValues.allergens) {
                    if (filterController.filterValues.allergens[k] == id) {
                        flag = k;
                    }
                }

                if (flag) {
                    filterController.filterValues.allergens.splice(flag, 1);
                } else {
                    filterController.filterValues.allergens.push(id);
                }

            } else {
                filterController.filterValues.allergens.push(id);

            }

            filterController.filterCounters.allergens++;
            MainService.filterProducts(filterController.filterValues);
            countAllergens(id);
        }

        function countAllergens(id) {
            if(filterController.filterCounters.allergenObject.hasOwnProperty(id)) {
                filterController.filterCounters.allergenObject[id]++;
            } else {
                filterController.filterCounters.allergenObject[id] = 1;
            }

            console.log(filterController.filterCounters);
        }
    }]);