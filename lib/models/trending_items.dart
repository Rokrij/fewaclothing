class TrendingItems {
  String id;
  String name;
  String description;
  String color;
  String size;
  String price;
  String stock;
  String image;
  String category;
  String type;

  TrendingItems(
      {this.id,
        this.name,
        this.description,
        this.color,
        this.size,
        this.price,
        this.stock,
        this.image,
        this.category,
        this.type});

  TrendingItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    color = json['color'];
    size = json['size'];
    price = json['price'];
    stock = json['stock'];
    image = json['image'];
    category = json['category'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['color'] = this.color;
    data['size'] = this.size;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['image'] = this.image;
    data['category'] = this.category;
    data['type'] = this.type;
    return data;
  }
}