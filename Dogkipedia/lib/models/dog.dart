class Dog {
  String name;
  String type;
  String imagePath;
  String description;

  Dog({
    required this.name,
    required this.type,
    required this.imagePath,
    required this.description,
  });

  String get _name => name;
  String get _type => type;
  String get _imagePath => imagePath;
  String get _description => description;
}
