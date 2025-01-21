/// currentPage : 1
/// numberOfPages : 2
/// limit : 40
/// nextPage : 2

class PaginationInfoDto {
  PaginationInfoDto({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,});

  PaginationInfoDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    map['nextPage'] = nextPage;
    return map;
  }

}