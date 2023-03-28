class ProductsListData {


  ProductsListData(
    this.imagePath,
    this.titleTxt,
    this.subTxt,
    this.reviews ,
    this.rating,
      this.price
  );

  String imagePath;
  String titleTxt;
  String subTxt;
  double rating;
  int reviews;
  int price;

  factory ProductsListData.fromJson(Map<String, dynamic> json ) {
    return ProductsListData(
      'assets/coffee/'+json['path']+'.jpg',
      json['nom'],
      json['description'],
      4,
      12,
      json['prix']

    );
  }


}
