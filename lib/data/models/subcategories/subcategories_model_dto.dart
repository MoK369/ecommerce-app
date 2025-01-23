import 'package:ecommerce/data/models/pagination_info/pagination_info_dto.dart';
import 'package:ecommerce/domain/models/categories/categories_model.dart';
import 'package:ecommerce/domain/models/subcategories/Subcategories_model.dart';

/// results : 2
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// data : [{"_id":"6407f276b575d3b90bf957b8","name":"Bags & luggage","slug":"bags-and-luggage","category":"6439d5b90049ad0b52b90048","createdAt":"2023-03-08T02:27:02.780Z","updatedAt":"2023-04-14T23:10:29.386Z"},{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048","createdAt":"2023-03-08T02:26:11.097Z","updatedAt":"2023-04-14T23:10:29.386Z"}]

class SubcategoriesModelDto {
  SubcategoriesModelDto({
    this.results,
    this.metadata,
    this.data,
  });

  SubcategoriesModelDto.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? PaginationInfoDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SubCategoryDataDto.fromJson(v));
      });
    }
  }
  num? results;
  PaginationInfoDto? metadata;
  List<SubCategoryDataDto>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "6407f276b575d3b90bf957b8"
/// name : "Bags & luggage"
/// slug : "bags-and-luggage"
/// category : "6439d5b90049ad0b52b90048"
/// createdAt : "2023-03-08T02:27:02.780Z"
/// updatedAt : "2023-04-14T23:10:29.386Z"

class SubCategoryDataDto {
  SubCategoryDataDto({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  SubCategoryDataDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? id;
  String? name;
  String? slug;
  String? category;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  SubcategoryData convertToSubcategoryData() {
    return SubcategoryData(
      id: id,
      name: name,
      slug: slug,
      category: category,
    );
  }
}
