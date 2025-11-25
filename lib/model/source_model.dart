class SourcesModel {
  final String status;

  final List<Source> source;

  SourcesModel({
    required this.status,
    required this.source,
  });

  factory SourcesModel.fromJson(Map<String, dynamic> json) => SourcesModel(
        status: json["status"],
        source: (json["status"] as List)
            .map(
              (e) => Source.fromJson(e),
            )
            .toList(),
      );
}

class Source {
  final String id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}
