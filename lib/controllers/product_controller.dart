import 'package:get/get.dart';
import '../models/product.dart';
import '../service/product_service.dart';

class ProductController extends GetxController {
  final ProductService productService;
  final RxList<Product> products = <Product>[].obs;
  final RxBool isSignedIn = false.obs;
  final RxBool isLoading = false.obs;

  ProductController({required this.productService});

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final fetchedProducts = await productService.fetchProducts();
      products.value =
          isSignedIn.value
              ? fetchedProducts.map((p) => p.copyWithDiscount()).toList()
              : fetchedProducts;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load products');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleSignIn() {
    isSignedIn.value = !isSignedIn.value;
    // Refresh products to apply/remove discount
    final currentProducts = products.toList();
    products.value =
        isSignedIn.value
            ? currentProducts.map((p) => p.copyWithDiscount()).toList()
            : currentProducts
                .map((p) => Product(title: p.title, price: p.price / 0.8))
                .toList();
  }
}
