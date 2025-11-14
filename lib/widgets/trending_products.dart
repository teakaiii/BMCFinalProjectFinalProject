import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/screens/product_detail_screen.dart';
import 'package:ecommerce_app/widgets/product_card.dart';

class TrendingProducts extends StatelessWidget {
  const TrendingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('products')
          .orderBy('createdAt', descending: true)
          .limit(5) // Limiting to 5 trending products
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const SizedBox.shrink(); // Don't show anything if no products
        }

        final products = snapshot.data!.docs;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Trending Now',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 280, // Adjust height as needed
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final productDoc = products[index];
                  final productData = productDoc.data()! as Map<String, dynamic>;

                  return SizedBox(
                    width: 180, // Adjust width as needed
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ProductCard(
                        productName: productData['name'],
                        price: productData['price'],
                        imageUrl: productData['imageUrl'],
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(
                              productData: productData,
                              productId: productDoc.id,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
