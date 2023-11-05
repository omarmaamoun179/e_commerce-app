class MetadataPrands {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  MetadataPrands({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  factory MetadataPrands.fromJson(Map<String, dynamic> json) => MetadataPrands(
        currentPage: json['currentPage'] as int?,
        numberOfPages: json['numberOfPages'] as int?,
        limit: json['limit'] as int?,
        nextPage: json['nextPage'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'currentPage': currentPage,
        'numberOfPages': numberOfPages,
        'limit': limit,
        'nextPage': nextPage,
      };
}
