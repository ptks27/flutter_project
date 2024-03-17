class Shoe1 {
  String name;
  String price;
  String imagePath;
  String description;
  String rating;

  Shoe1({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.rating,
  });

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _description => description;
  String get _rating => rating;
}
