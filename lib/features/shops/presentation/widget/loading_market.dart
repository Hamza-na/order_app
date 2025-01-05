import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5, // Number of skeleton items to show
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Skeletonizer(
            enabled: true, // Enables skeleton effect
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              shadowColor: Colors.black.withOpacity(0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Simulate an image placeholder
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.grey.shade300, // Dummy image container
                  ),
                  const SizedBox(height: 8),
                  // Simulate text placeholders
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      height: 20,
                      width: 200,
                      color: Colors.grey.shade300, // Dummy text container
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      height: 20,
                      width: 150,
                      color: Colors.grey.shade300, // Dummy text container
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
