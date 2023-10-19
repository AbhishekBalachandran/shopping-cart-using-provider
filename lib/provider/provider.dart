import 'package:flutter/material.dart';
import 'package:provider_task/model/models.dart';

class ShoppingAppProvider with ChangeNotifier {
  int itemCount = 1;
  int? total;
  bool? isSaved;
  bool isCartContains = false;
  bool isSavedContains = false;
  List<CartModel> cartItems = [];
  List<SavedModel> savedItems = [];
  void addCount() {
    itemCount++;
    notifyListeners();
  }

  void removeCount() {
    itemCount > 1 ? itemCount-- : null;
    notifyListeners();
  }

  String totalPrice(int price, int itemCount) {
    total = price * itemCount;
    notifyListeners();
    return total.toString();
  }

  void addToCart(int index) {
    Iterable<CartModel> visibleItem =
        cartItems.where((item) => item.name!.contains(items[index]['name']));

    if (visibleItem.isEmpty) {
      cartItems.add(CartModel(
          name: items[index]['name'],
          price: items[index]['price'],
          finalPrice: total,
          image: items[index]['image'],
          itemCount: itemCount));
    } else {
      visibleItem.forEach((item) {
        item.itemCount = item.itemCount! + itemCount;
      });
    }
    notifyListeners();
  }

  void isCart(int index) {
    Iterable<CartModel> matchingItem =
        cartItems.where((item) => item.name!.contains(items[index]['name']));
    if (matchingItem.isEmpty) {
      isCartContains = false;
    } else {
      isCartContains = true;
    }
    notifyListeners();
  }

  void addCartItemCount(int index) {
    cartItems[index].itemCount = cartItems[index].itemCount! + 1;
    notifyListeners();
  }

  void removeCartItemCount(int index) {
    cartItems[index].itemCount = cartItems[index].itemCount! - 1;
    notifyListeners();
  }

  void deleteItem(index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  void resetItemCount() {
    itemCount = 1;
    notifyListeners();
  }

  void onTapSave(index) {
    Iterable<SavedModel> alreadySavedItems =
        savedItems.where((element) => element.itemIndex == index);
    if (alreadySavedItems.isEmpty) {
      savedItems.add(SavedModel(itemIndex: index));
    } else {
      null;
    }
    notifyListeners();  
  }

  void removeSaved(index) {
    savedItems.removeAt(index);
    notifyListeners();
  }

  isSavedList(index)  { 
    Iterable<SavedModel> alreadySavedItems =
        savedItems.where((element) => element.itemIndex == index);
    if (alreadySavedItems.isEmpty) {
      isSaved = false;
    } else {  
      isSaved = true;
    }
    print(isSaved.toString());
  }
}
