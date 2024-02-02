import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}

class Cart {
  List<Product> items = [];
  List<Product> wishlist = [];

  void addToCart(Product product) {
    items.add(product);
  }

  void addToWishlist(Product product) {
    wishlist.add(product);
  }
}

class WishlistPage extends StatelessWidget {
  final List<Product> products;

  WishlistPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index], showAddToCart: true);
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  final List<Product> allProducts;
  final Function(Product) addToWishlist;

  ProductDetailsPage({
    required this.product,
    required this.allProducts,
    required this.addToWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: CarouselSlider(
                  items: List.generate(
                    5,
                    (index) => Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  options: CarouselOptions(
                    height: double.infinity,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      // Handle page change
                    },
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '\$${product.price}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            // Handle the "Add to Cart" button press
                            // You can add your logic for adding the product to the cart here
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart),
                              SizedBox(width: 8.0),
                              Text('Add to Cart'),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            addToWishlist(product);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${product.name} added to the wishlist'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite),
                              SizedBox(width: 8.0),
                              Text('Add to Wishlist'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Product 1',
      imageUrl: 'https://via.placeholder.com/150',
      price: 10.0,
    ),
    Product(
      name: 'Product 2',
      imageUrl: 'https://via.placeholder.com/150',
      price: 20.0,
    ),
    Product(
      name: 'Product 3',
      imageUrl: 'https://via.placeholder.com/150',
      price: 30.0,
    ),
    Product(
      name: 'Product 4',
      imageUrl: 'https://via.placeholder.com/150',
      price: 15.0,
    ),
    Product(
      name: 'Product 5',
      imageUrl: 'https://via.placeholder.com/150',
      price: 25.0,
    ),
    Product(
      name: 'Product 6',
      imageUrl: 'https://via.placeholder.com/150',
      price: 35.0,
    ),
  ];

  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUsPage(),
                ),
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cartItems: cart.items),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WishlistPage(products: cart.wishlist),
                  ),
                );
              },
            ),
          ],
        ),
        body: Theme(
          data: ThemeData(
            scaffoldBackgroundColor: Colors.white,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 90.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nishkaam Innovations',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      height: 200.0, autoPlay: true, enlargeCenterPage: true),
                  items: ['Image 1', 'Image 2', 'Image 3'].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Center(
                            child: Text(i,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 250,
                    child: Row(
                      children: [
                        for (int i = 0; i < 3; i++)
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsPage(
                                      product: products[i],
                                      allProducts: products,
                                      addToWishlist: (product) {
                                        cart.addToWishlist(product);
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: ProductCard(product: products[i]),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  child: Row(
                    children: [
                      for (int i = 3; i < 6; i++)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsPage(
                                    product: products[i],
                                    allProducts: products,
                                    addToWishlist: (product) {
                                      cart.addToWishlist(product);
                                    },
                                  ),
                                ),
                              );
                            },
                            child: ProductCard(product: products[i]),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ListPage()));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    child: Text('List of Products',
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.blue,
              child: Image.network(
                'https://via.placeholder.com/150',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Team description here',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  for (int i = 0; i < 3; i++)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150',
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  for (int i = 3; i < 6; i++)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150',
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Center(
        child: Text('This is another page'),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> cartItems;

  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index].name),
            subtitle: Text('Price: \$${cartItems[index].price}'),
          );
        },
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Product 1',
      price: 10.0,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      name: 'Product 2',
      price: 20.0,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      name: 'Product 3',
      price: 30.0,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      name: 'Product 4',
      price: 15.0,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      name: 'Product 5',
      price: 25.0,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      name: 'Product 6',
      price: 35.0,
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
        body: Theme(
          data: ThemeData(
            scaffoldBackgroundColor: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Nishkaam Innovations',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 250,
                    child: Row(
                      children: [
                        for (int i = 0; i < 3; i++)
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsPage(
                                      product: products[i],
                                      allProducts: products,
                                      addToWishlist: (product) {
                                        // Placeholder function, should be replaced with actual logic
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: ProductCard(product: products[i]),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  child: Row(
                    children: [
                      for (int i = 3; i < 6; i++)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsPage(
                                    product: products[i],
                                    allProducts: products,
                                    addToWishlist: (product) {
                                      // Placeholder function, should be replaced with actual logic
                                    },
                                  ),
                                ),
                              );
                            },
                            child: ProductCard(product: products[i]),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final bool showAddToCart;

  ProductCard({required this.product, this.showAddToCart = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Column(
          children: <Widget>[
            Image.network(
              product.imageUrl,
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(
              product.name,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
            if (showAddToCart) ...[
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  // Handle the "Add to Cart" button press
                  // You can add your logic for adding the product to the cart here
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 8.0),
                    Text('Add to Cart'),
                  ],
                ),
              ),
            ],
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(HomePage());
}
