import 'package:flutter/material.dart';

import 'cartItem.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBagScreen(),
    );
  }
}

class MyBagScreen extends StatefulWidget {
  @override
  _MyBagScreenState createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  List<CartItem> cartItems = [
    CartItem(
      name: 'Pullover',
      price: 51,
      color: 'Black',
      size: 'L',
      quantity: 1,
      imagePath: 'assets/Pullover.jpg',
    ),
    CartItem(
      name: 'T-Shirt',
      price: 30,
      color: 'Gray',
      size: 'L',
      quantity: 1,
      imagePath: 'assets/T-Shirt.jpg',
    ),
    CartItem(
      name: 'Sport Dress',
      price: 43,
      color: 'Black',
      size: 'M',
      quantity: 1,
      imagePath: 'assets/Sports_Dress.jpg',
    ),
  ];

  int calculateTotal() {
    return cartItems.fold(
        0, (total, item) => total + item.price * item.quantity);
  }

  void _incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      setState(() {
        cartItems[index].quantity--;
      });
    }
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Congratulations! Your order has been placed.'),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Bag',
          style: TextStyle(
            fontSize: 26, // Slightly larger font size for emphasis
            fontWeight: FontWeight.bold, // Bold for a more professional look
            color: Colors.black, // Ensuring color consistency
            letterSpacing: 1.2, // Adding some spacing between letters
          ),
        ),
        backgroundColor: Colors.white, // Keeping it clean with white background
        foregroundColor: Colors.black, // Ensuring all icons/controls remain black
        elevation: 0, // Flat design without shadow
        // Centering the title for a more balanced look
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          item.imagePath,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text('Color: ${item.color}  Size: ${item.size}'),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () => _decrementQuantity(index),
                              child: Text(
                                '-',
                                style: TextStyle(
                                    fontSize: 28, color: Colors.black),
                              ),
                            ),
                            Text('${item.quantity}',
                                style: TextStyle(fontSize: 16)),
                            TextButton(
                              onPressed: () => _incrementQuantity(index),
                              child: Text(
                                '+',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        Text(
                          '\$${item.price * item.quantity}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total amount:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${calculateTotal()}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: () => _showSnackBar(context),
              child: Text(
                'CHECK OUT',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}