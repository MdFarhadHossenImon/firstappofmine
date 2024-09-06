import 'package:flutter/material.dart';
import 'package:firstappofmine/models/product.dart';
import 'package:firstappofmine/screens/update_product_screen.dart';
import 'package:http/http.dart' as http;

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  Future<void> deleteProduct(BuildContext context) async {
    final url = Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/${product.id}');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product deleted successfully')),
        );
      } else {
        // Show error message if the API call failed
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to delete product')),
        );
      }
    } catch (error) {
      // Show error message if there was an issue with the request
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode}'),
          Text('Price: \$${product.unitPrice}'),
          Text('Quantity: ${product.quantity}'),
          Text('Total Price: \$${product.totalPrice}'),
          const Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const UpdateProductScreen();
                    }),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
              TextButton.icon(
                onPressed: () {
                  deleteProduct(context);  // Call the deleteProduct function
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
