class SourceModel{
 
  String id;
  String name;

  SourceModel({
    this.id = '',
    this.name = '',
  });

  factory SourceModel.fromJson(Map<String, dynamic> parsedJson) {
    return SourceModel(
      id: (parsedJson['id'] != null) ? parsedJson['id'] : '',
      name: (parsedJson['name'] != null) ? parsedJson['name'] : '',
    );
  }
}