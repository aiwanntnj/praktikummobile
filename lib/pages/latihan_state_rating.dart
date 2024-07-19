import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);

  static List<Product> getProducts() {
    return <Product>[
      Product("Pixel", "Pixel hanphone buatan Google", 800, "pixel.png"),
      Product("Laptop", "Laptop untuk pekerjaan", 2000, "laptop.png"),
      Product("Tablet", "Tablet is the most useful device ever for meeting", 1500, "tablet.png"),
      Product("Pendrive", "iPhone is the stylist phone ever", 100, "pendrive.png"),
      Product("Floppy Drive", "iPhone is the stylist phone ever", 20, "floppy.png"),
      Product("iPhone", "iPhone is the stylist phone ever", 1000, "iphone.png"),
      Product("iPhone XR", "iPhone is the stylist phone XRever", 1000, "iphone XR.png"),
    ];
  }
}

class MyRatingPage extends StatelessWidget {
  MyRatingPage({Key? key, required this.title}) : super(key: key);
  final String title;
  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Navigation")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ProductBox(item: items[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(item: items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  ProductPage({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text(item.image),
                ),
              ),
              // Image.asset("assets/appimages/" + item.image),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        item.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(item.description),
                      Text("Price: ${item.price}"),
                      RatingBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _size = 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: _rating >= 1
                ? Icon(Icons.star, size: _size)
                : Icon(Icons.star_border, size: _size),
            color: Colors.red[500],
            onPressed: () => _setRating(1),
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: _rating >= 2
                ? Icon(Icons.star, size: _size)
                : Icon(Icons.star_border, size: _size),
            color: Colors.red[500],
            onPressed: () => _setRating(2),
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: _rating >= 3
                ? Icon(Icons.star, size: _size)
                : Icon(Icons.star_border, size: _size),
            color: Colors.red[500],
            onPressed: () => _setRating(3),
            iconSize: _size,
          ),
        ),
      ],
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 100,
              width: 150,
              color: Colors.blue[400],
              child: Center(
                child: Text(item.image),
              ),
            ),
            // Image.asset("assets/appimages/" + item.image),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      item.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(item.description),
                    Text("Price: ${item.price}"),
                    RatingBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
