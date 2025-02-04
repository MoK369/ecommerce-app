import 'package:ecommerce/domain/models/pagination_info/pagination_info.dart';

/// results : 2
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// data : [{"_id":"6407f276b575d3b90bf957b8","name":"Bags & luggage","slug":"bags-and-luggage","category":"6439d5b90049ad0b52b90048","createdAt":"2023-03-08T02:27:02.780Z","updatedAt":"2023-04-14T23:10:29.386Z"},{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048","createdAt":"2023-03-08T02:26:11.097Z","updatedAt":"2023-04-14T23:10:29.386Z"}]

class SubcategoriesModel {
  SubcategoriesModel({
    this.results,
    this.metadata,
    this.data,
  });

  num? results;
  PaginationInfo? metadata;
  List<SubcategoryData>? data;
}

/// _id : "6407f276b575d3b90bf957b8"
/// name : "Bags & luggage"
/// slug : "bags-and-luggage"
/// category : "6439d5b90049ad0b52b90048"
/// createdAt : "2023-03-08T02:27:02.780Z"
/// updatedAt : "2023-04-14T23:10:29.386Z"

class SubcategoryData {
  SubcategoryData({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? category;
  String? createdAt;
  String? updatedAt;
}
