/**
 * Category page controller
 * @param $scope
 */
angular.module('categoryPage')
    .controller('productsController', ['$scope','MainService', function ($scope, MainService) {

        var productsController = this;

        productsController.init = init;
        productsController.addCart = addCart;
        productsController.updateCart = updateCart;
        productsController.checkFlag = checkFlag;

        productsController.minus = false;
        productsController.plus = true;
        productsController.productId = 0;

        function init(tree, url) {
            productsController.tree = tree;
            MainService.setUrl(url);
            MainService.setTree(tree);
        }

        function checkFlag(flag) {
            return !!flag;
        }

        function watchProduct() {
            return productsController.productId;
        }

        $scope.$watch(watchProduct, function (data, oldData) {
            if (data > 0) {
                addCart(data);
            }
        });

        function addCart(productId) {
            MainService.addToCart(MainService.getUrl('add_cart'), {product_id: productId, quantity: 1})
                .then(function (response) {
                    MainService.updateTree(productId, productsController.plus);
                    productsController.tree = MainService.getTree();
                    MainService.setTotal(response.data.total_cart);

                    MainService.getCarts(MainService.getUrl('get_cart'))
                        .then(function (response) {
                            MainService.setCartProducts(response.data.products);
                        })
                    productsController.productId = 0;
                })
        }

        function updateCart(productId, flag) {
            MainService.updateCart(MainService.getUrl('edit_cart'), {product_id: productId, quantity: flag ? 1 : -1})
                .then(function (response) {
                    MainService.updateTree(productId, flag);
                    MainService.updateCartProducts(productId, flag);
                    productsController.tree = MainService.getTree();
                    MainService.setTotal(response.data.total_cart);
                })
        }

        function watchTree() {
            return MainService.getTotalProducts();
        }

        $scope.$watch(watchTree, function (data, oldData) {
            if(data) {
                productsController.tree = MainService.getTree();
            }
        })

    }]);