import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  RxBool isLoading = false.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> addProduct(Map<String, dynamic> data) async {
    var hasil = await firestore.collection("products").add(data);
    
    await firestore
        .collection("products")
        .doc(hasil.id)
        .update({"productId": hasil.id});

    try {
      return {
        "error": false,
        "message": "Product added successfully",
      };
    } catch (e) {
      print(e);
      return {
        "error": true,
        "message": "Failed to add product",
      };
    }
  }
}
