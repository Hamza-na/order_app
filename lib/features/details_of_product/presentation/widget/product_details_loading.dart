import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsLoading extends StatelessWidget {
  const ProductDetailsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true, // Enable skeleton loading
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Skeleton
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name and Price Skeleton
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Product Name', style: TextStyle(fontSize: 20)),
                      Text('\$99.99', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Product Rating Skeleton
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star_half, color: Colors.amber),
                      SizedBox(width: 8),
                      Text('4.5 Rating'),
                    ],
                  ),
                  const SizedBox(height: 25),
                  // Product Details Skeleton
                  const Text('Details', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  const  Text(
                    'This is a description of the product. It gives an overview of the features and specifications.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  // Quantity and Buttons Skeleton
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Quantity', style: TextStyle(fontSize: 18)),
                      Row(
                        children: [
                          Icon(Icons.add_circle_outline),
                          Text('1', style: TextStyle(fontSize: 18)),
                          Icon(Icons.remove_circle_outline),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Total Price and Add to Cart Skeleton
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Price: \$99.99',
                          style: TextStyle(fontSize: 15)),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        child: const Row(
                          children: [
                            Text('Add to Cart'),
                            SizedBox(width: 8),
                            Icon(Icons.shopping_cart),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
