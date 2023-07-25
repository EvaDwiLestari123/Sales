import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {
  // Untuk menyimpan item dan jumlahnya
  final Map<String, int> _itemsInCart = {};

  // Memberikan akses read-only ke _itemsInCart
  Map<String, int> get itemsInCart => Map.unmodifiable(_itemsInCart);

  // Untuk menambah item ke keranjang
  void addItem(String item, int count) {
    _itemsInCart[item] = (_itemsInCart[item] ?? 0) + count;
    notifyListeners(); // Memberi tahu listeners bahwa ada perubahan
  }

  // Untuk menghapus item dari keranjang
  void removeItem(String item) {
    _itemsInCart.remove(item);
    notifyListeners(); // Memberi tahu listeners bahwa ada perubahan
  }
}
