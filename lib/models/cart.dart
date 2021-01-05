class FewaCart {
  String id;
  String productName;
  String price;
  String size;
  String quantity;
  String email;
  String image;

  FewaCart(
      {this.id,
        this.productName,
        this.price,
        this.size,
        this.quantity,
        this.email,
        this.image});

  FewaCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    price = json['price'];
    size = json['size'];
    quantity = json['quantity'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['size'] = this.size;
    data['quantity'] = this.quantity;
    data['email'] = this.email;
    data['image'] = this.image;
    return data;
  }
}