import 'package:ecommerce/domain/models/pagination_info/pagination_info.dart';

class AllCategoriesModel {
  num? results;
  PaginationInfo? metadata;
  List<CategoryData>? data;
  AllCategoriesModel({
    this.results,
    this.metadata,
    this.data,
  });
}

class CategoryData {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  CategoryData({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return name ?? "NO NAME";
  }
}
