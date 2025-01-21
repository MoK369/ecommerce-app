import 'package:ecommerce/data/models/pagination_info/pagination_info_dto.dart';
import 'package:ecommerce/domain/models/categories/categories_model.dart';

class CategoriesModelDto {
  num? results;
  PaginationInfoDto? metadata;
  List<CategoryDataDto>? data;
  CategoriesModelDto({
    this.results,
    this.metadata,
    this.data,
  });

  CategoriesModelDto.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? PaginationInfoDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDataDto.fromJson(v));
      });
    }
  }

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

class CategoryDataDto {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryDataDto({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoryDataDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  CategoryData convertToCategoryData() {
    return CategoryData(
        id: id,
        name: name,
        slug: slug,
        image: image,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }
}