/**
 * Footer product controller
 * @param $scope
 */
angular.module('categoryPage')
    .controller('footerProductController', ['$scope','MainService', function ($scope, MainService) {

        var footerProductController = this;

        footerProductController.addCart = addCart;


        function addCart(productId) {
            MainService.addToCart(MainService.getUrl('add_cart'), {product_id: productId, quantity: 1})
                .then(function (response) {
                    MainService.updateTree(productId, true);
                    MainService.setTotal(response.data.total_cart);

                    MainService.getCarts(MainService.getUrl('get_cart'))
                        .then(function (response) {
                            MainService.setCartProducts(response.data.products);
                        })
                })
        }
    }]);