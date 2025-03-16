import 'package:get/get.dart';
import 'package:iu_bachelor_thesis/models/products_state.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';
import 'user_controller.dart';

class ProductController extends GetxController {
  final ProductService _productService;
  final UserController _userController;

  var hasDiscount = false.obs;
  var productsState = ProductsState.loading().obs;

  ProductController(this._productService, this._userController) {
    hasDiscount.value = _userController.isSignedIn.value;
    _userController.isSignedIn.listen(_handleUserSignIn);
  }

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void _handleUserSignIn(bool isSignedIn) {
    if (productsState.value.isLoaded()) {
      final products = (productsState.value as ProductsLoaded).products;
      final updatedProducts =
          isSignedIn
              ? products.map((product) => product.copyWithDiscount()).toList()
              : products
                  .map((product) => product.restoreOriginalPrice())
                  .toList();
      productsState.value = ProductsState.loaded(updatedProducts);
    }
    hasDiscount.value = isSignedIn;
  }

  Future<void> loadProducts() async {
    productsState.value = ProductsState.loading();
    try {
      var products = await _productService.fetchProducts();
      if (hasDiscount.value) {
        products =
            products.map((product) => product.copyWithDiscount()).toList();
      }
      productsState.value = ProductsState.loaded(products);
    } catch (err) {
      productsState.value = ProductsState.error(err.toString());
    }
  }
}
