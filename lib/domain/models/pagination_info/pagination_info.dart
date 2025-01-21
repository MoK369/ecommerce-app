/// currentPage : 1
/// numberOfPages : 2
/// limit : 40
/// nextPage : 2

class PaginationInfo {
  PaginationInfo({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;
}
