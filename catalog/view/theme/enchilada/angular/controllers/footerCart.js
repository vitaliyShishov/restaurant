/**
 * Footer cart controller
 * @param $scope
 */
angular.module('categoryPage')
    .controller('cartController', ['$scope', 'MainService', function ($scope, MainService) {

        var cartController = this;
        cartController.init = init;
        cartController.updateCart = updateCart;
        cartController.deleteFromCart = deleteFromCart;
        cartController.changeMethod = changeMethod;
        cartController.addOrder = addOrder;

        cartController.minus = false;
        cartController.plus = true;
        cartController.paymentMethod = 1;

        function init(products, total) {
            cartController.products = products;
            cartController.total = total;
            MainService.setTotal(total);
            MainService.setCartProducts(products);
        }

        function updateCart(productId, flag) {
            MainService.updateCart(MainService.getUrl('edit_cart'), {product_id: productId, quantity: flag ? 1 : -1})
                .then(function (response) {
                    MainService.updateTree(productId, flag);
                    MainService.updateCartProducts(productId, flag);
                    MainService.setTotal(response.data.total_cart);
                })
        }

        function deleteFromCart(productId) {
            MainService.deleteCart(MainService.getUrl('delete_cart'), {product_id: productId})
                .then(function (response) {
                    MainService.updateTreeAfterDelete(productId);
                    MainService.updateCartProductsAfterDelete(productId);
                    MainService.setTotal(response.data.total_cart);
                })
        }

        function changeMethod(method) {
            cartController.paymentMethod = method;
        }

        function addOrder() {
            if (Object.keys(cartController.products).length > 0) {

                MainService.addOrder(MainService.getUrl('add_order'), cartController.products, cartController.paymentMethod)
                    .then(function (response) {
                        window.location.href = response.data.success;
                    });
            }
        }

        function watchTotal() {
            return MainService.getTotal();
        }

        function watchCart() {
            return MainService.getCartProducts();
        }

        $scope.$watch(watchTotal, function (data, oldData) {
            cartController.total = data;
        });

        $scope.$watch(watchCart, function (data, oldData) {
            cartController.products = data;
        })
    }]);