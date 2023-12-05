class Dog {
  String name;
  String type;
  String imagePath;

  Dog({
    required this.name,
    required this.type,
    required this.imagePath,
  });

  String get _name => name;
  String get _type => type;
  String get _imagePath => imagePath;
}
