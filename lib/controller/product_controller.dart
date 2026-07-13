import 'dart:convert';
import 'dart:developer';
import 'package:ostad_api_1/model/product_model.dart';
import 'package:ostad_api_1/urls/urls.dart';
import 'package:http/http.dart' as http;

class ProductController {
  /// get
  List<Data> products = [];

  Future<void> getReadProduct() async {
    final url = Uri.parse(Urls.getReadProduct);
    final response = await http.get(url);

    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);
      ReadProductModel model = ReadProductModel.fromJson(jsonResponse);
      products = model.data ?? [];
    }
  }

  /// post
  Future<bool> createProduct(Data data) async {
    final url = Uri.parse(Urls.postCreateProduct);
    final response = await http.post(
      url,

      headers: {'Content-Type': 'application/json'},

      body: jsonEncode({
        "ProductName": data.productName,
        "ProductCode": DateTime.now().microsecondsSinceEpoch,
        "Img": data.img,
        "Qty": data.qty,
        "UnitPrice": data.unitPrice,
        "TotalPrice": data.totalPrice,
      }),
    );

    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  /// delete by id
  Future<bool> deleteProduct({required String productID}) async {
    final url = Uri.parse(Urls.deleteProductByID(productID: productID));
    final response = await http.get(url);

    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      getReadProduct();
      return true;
    } else {
      return false;
    }
  }
}
