class ProductsListData {
  ProductsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.reviews = 80,
    this.rating = 4.5,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double rating;
  int reviews;

  static List<ProductsListData> productList = <ProductsListData>[
    ProductsListData(
      imagePath: 'assets/coffee/coffee_1.jpg',
      titleTxt: 'Machine à café',
      subTxt: 'Pour un café parfait',
      reviews: 80,
      rating: 4.4,
    ),
    ProductsListData(
      imagePath: 'assets/coffee/coffee_2.jpg',
      titleTxt: 'Cafetière à piston',
      subTxt: 'Café doux et savoureux',
      reviews: 74,
      rating: 4.5,
    ),
    ProductsListData(
      imagePath: 'assets/coffee/coffee_3.jpg',
      titleTxt: 'Machine à café expresso',
      subTxt: 'Pour les amateurs de café corsé',
      reviews: 62,
      rating: 4.0,
    ),
    ProductsListData(
      imagePath: 'assets/coffee/coffee_4.jpg',
      titleTxt: 'Moulin à café',
      subTxt: 'Pour une mouture fraîche',
      reviews: 90,
      rating: 4.4,
    ),
    ProductsListData(
      imagePath: 'assets/coffee/coffee_5.jpg',
      titleTxt: 'Cafetière filtre',
      subTxt: 'Simple et efficace',
      reviews: 240,
      rating: 4.5,
    ),
  ];
}
