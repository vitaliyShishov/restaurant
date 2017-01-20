angular.module('categoryPage').factory('MainService', ['$http', '$q', function ($http, $q) {
    var tree = {};
    var url = {};
    var total = 0;
    var cartProducts = {};
    var totalProducts = 0;
    var filterCounters = {};

    return {
        getTree: function () {
            return tree;
        },
        setTree: function (value) {
            tree = value;
        },
        getUrl: function (key) {
            return url[key];
        },
        setUrl: function (value) {
            url = value;
        },
        getTotal: function () {
            return total;
        },
        setTotal: function (value) {
            total = value;
        },
        getTotalProducts: function () {
            return totalProducts;
        },
        setTotalProducts: function (value) {
            totalProducts = value;
        },
        getCartProducts: function () {
            return cartProducts;
        },
        setCartProducts: function (value) {
            cartProducts = value;
        },
        setFilterCounters: function (value) {
            filterCounters = value;
        },
        getFilterCounters: function () {
            return filterCounters;
        },
        addToCart: function (requestUrl, requestData) {
            return $http({
                method: 'post',
                url: requestUrl,
                data: $.param(requestData),
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            })
                .success(function (response) {
                    return response;
                })
                .error(function (error) {
                    return $q.reject(error);
                });
        },
        updateCart: function (requestUrl, requestData) {
            return $http({
                method: 'post',
                url: requestUrl,
                data: $.param(requestData),
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            })
                .success(function (response) {
                    return response;
                })
                .error(function (error) {
                    return $q.reject(error);
                });
        },
        deleteCart: function (requestUrl, requestData) {
            return $http({
                method: 'post',
                url: requestUrl,
                data: $.param(requestData),
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            })
                .success(function (response) {
                    return response;
                })
                .error(function (error) {
                    return $q.reject(error);
                });
        },
        getCarts: function (requestUrl) {
            return $http({
                method: 'post',
                url: requestUrl
            })
                .success(function (response) {
                    return response;
                })
                .error(function (error) {
                    return $q.reject(error);
                });
        },
        addOrder: function (requestUrl, requestData, method) {
            return $http({
                method: 'post',
                url: requestUrl,
                data: $.param({products: requestData, method: method, filters: this.getFilterCounters()}),
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            })
                .success(function (response) {
                    return response;
                })
                .error(function (error) {
                    return $q.reject(error);
                });
        },
        updateTree: function (productId, flag) {
            for (var p in tree) {
                if (tree[p].hasOwnProperty('children')) {
                    for (var c in tree[p].children) {
                        if (tree[p].children[c].hasOwnProperty('products')) {
                            for (var i in tree[p].children[c].products) {
                                if (tree[p].children[c].products[i].id == productId) {
                                    if (flag) {
                                        ++tree[p].children[c].products[i].quantity;
                                    } else {
                                        if (tree[p].children[c].products[i].quantity > 0) {
                                            --tree[p].children[c].products[i].quantity;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            this.setTree(tree);
        },
        updateCartProducts: function (productId, flag) {
            for (var k in cartProducts) {
                if (cartProducts[k].id == productId) {
                    if (flag) {
                        ++cartProducts[k].quantity;
                    } else {
                        if (cartProducts[k].quantity > 1) {
                            --cartProducts[k].quantity;
                        } else {
                            cartProducts.splice(k, 1);
                        }
                    }
                }
            }

            this.setCartProducts(cartProducts);
        },
        updateTreeAfterDelete: function (productId) {
            for (var p in tree) {
                if (tree[p].hasOwnProperty('children')) {
                    for (var c in tree[p].children) {
                        if (tree[p].children[c].hasOwnProperty('products')) {
                            for (var i in tree[p].children[c].products) {
                                if (tree[p].children[c].products[i].id == productId) {
                                    tree[p].children[c].products[i].quantity = 0;
                                }
                            }
                        }
                    }
                }
            }
            this.setTree(tree);
        },
        updateCartProductsAfterDelete: function (productId) {
            for (var k in cartProducts) {
                if (cartProducts[k].id == productId) {
                    cartProducts.splice(k, 1);
                }
            }

            this.setCartProducts(cartProducts);
        },
        filterProducts: function (filters) {
            var total = 0;
            for (var p in tree) {
                if (tree[p].hasOwnProperty('children')) {
                    for (var c in tree[p].children) {
                        if (tree[p].children[c].hasOwnProperty('products')) {
                            for (var i in tree[p].children[c].products) {
                                tree[p].children[c].products[i].flag = (this.checkFilterPrice(filters.price, tree[p].children[c].products[i].filter_price) &&
                                this.checkFilterKcal(filters.kcal, tree[p].children[c].products[i].energy) &&
                                this.checkIngredients(filters.ingredients, tree[p].children[c].products[i]) &&
                                this.checkNoneIngredients(filters.noneIngredients, tree[p].children[c].products[i]) &&
                                this.checkAllergens(filters.allergens, tree[p].children[c].products[i])
                                    ? true : false);
                                if (tree[p].children[c].products[i].flag) {
                                    ++total;
                                }
                            }
                        }
                    }
                }
            }
            this.setTotalProducts(total);
            this.setTree(tree);
        },
        checkFilterPrice: function (price, productPrice) {
            if (price > 0) {
                return productPrice <= parseInt(price);
            } else {
                return true;
            }
        },
        checkFilterKcal: function (kcal, productKcal) {
            if (kcal > 0) {
                return parseInt(productKcal) <= parseInt(kcal);
            } else {
                return true;
            }
        },
        checkIngredients: function (ingredients, product) {
            var counter = false;
            if (ingredients.length > 0) {
                if (product.ingredients.length > 0) {
                    for (var i in ingredients) {
                        for (var t in product.ingredients) {
                            if (parseInt(product.ingredients[t].id) == parseInt(ingredients[i])) {
                                counter = true;
                            }
                        }
                    }
                    return counter;
                } else {
                    return false
                }
            } else {
                return true;
            }
        },
        checkNoneIngredients: function (ingredients, product) {
            var counter = true;
            if (ingredients.length > 0) {
                if (product.ingredients.length > 0) {
                    for (var i in ingredients) {
                        for (var t in product.ingredients) {
                            if (parseInt(product.ingredients[t].id) == parseInt(ingredients[i])) {
                                counter = false;
                            }
                        }
                    }
                    return counter;
                } else {
                    return true;
                }
            } else {
                return true;
            }
        },
        checkAllergens: function(allergens, product) {
            var counter = true;
            if (allergens.length > 0) {
                if (product.allergens.length > 0) {
                    for (var i in allergens) {
                        for (var t in product.allergens) {
                            if (parseInt(product.allergens[t]) == parseInt(allergens[i])) {
                                counter = false;
                            }
                        }
                    }
                    return counter;
                } else {
                    return true;
                }
            } else {
                return true;
            }
        }
    }
}]);
