// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaginationCriteria {
  int pageNumber;
  int pageSize;
  int? total;
  
  PaginationCriteria({
    this.pageNumber = 1,
    this.pageSize = 10,
    this.total,
  });

  int get getPageNumber => pageNumber;
  int get getPageSize => pageSize;
  int? get getTotal => total;
  
}
