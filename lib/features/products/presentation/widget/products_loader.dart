import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsLoader extends StatelessWidget {
  const ProductsLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      itemCount: 6, // Number of placeholder cards
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 20,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 5),
                Container(
                  height: 15,
                  width: 100,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.grey[300], size: 16),
                        const SizedBox(width: 5),
                        Container(
                          height: 15,
                          width: 30,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                    Icon(Icons.favorite, color: Colors.grey[300]),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
