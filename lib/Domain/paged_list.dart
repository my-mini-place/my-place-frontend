class PagedList<T> {
  List<T> items;
  int totalCount;
  int pageIndex;
  int pageSize;

  PagedList({
    required this.items,
    required this.totalCount,
    required this.pageIndex,
    required this.pageSize,
  });

  int get totalPages => (totalCount / pageSize).ceil();

  bool get hasNextPage => pageIndex * pageSize < totalCount;
  bool get hasPreviousPage => pageIndex > 1;

  factory PagedList.fromJson(
      Map<String, dynamic> json, T Function(dynamic json) fromJsonT) {
    return PagedList<T>(
      items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
      totalCount: json['totalCount'] as int,
      pageIndex: json['pageIndex'] as int,
      pageSize: json['pageSize'] as int,
    );
  }
}
