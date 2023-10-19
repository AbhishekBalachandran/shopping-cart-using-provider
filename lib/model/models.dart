import 'package:provider_task/utils/image_constants/image_constants.dart';

List<Map<String, dynamic>> items = [
  {
    'name': 'Men Full Sleeve Solid Sweatshirt',
    'price': 559,
    'image':
        ImageConstants.men_full_sleeve_solid,
  },
  {
    'name': 'Men Solid Sports Jacket',
    'price': 1100,
    'image':
        ImageConstants.solid_sports_jacket,
  },
  {
    'name': 'Women Fit and Flare Black Dress',
    'price': 1690,
    'image':
        ImageConstants.fit_flare_black_dress,
  },
  {
    'name': 'Women A-line White Dress',
    'price': 1290,
    'image':
         ImageConstants.a_line_white_dress,
  },
  {
    'name': 'Men Full Sleeve Printed Hooded Sweatshirt',
    'price': 1690,
    'image':
         ImageConstants.full_sleeve_printed_hooded_sweatshirt,
  },
  {
    'name': 'Men Solid Denim Jacket',
    'price': 1290,
    'image':
         ImageConstants.solid_denim_jacket,
  }
];

List scrollingItems = [
  'All',
  'Men\'s Clothing',
  'Women\'s Clothing',
  'Kids Fashion',
  'Casual and Sports Footwear',
  'Travel and Accessories',
];

class CartModel {
  String? name;
  int? price;
  int? finalPrice;
  String? image;
  int? itemCount;

  CartModel({
    required this.name,
    required this.price,
    required this.image,
    required this.itemCount,
    required this.finalPrice,
  });
}

class SavedModel {
  int itemIndex;

  SavedModel({required this.itemIndex});
}
