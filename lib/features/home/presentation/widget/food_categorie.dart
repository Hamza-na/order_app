import 'package:flutter/material.dart';
import 'package:order_app/core/constant/colors/colors.dart';


class FoodCategoriesWidget extends StatefulWidget {
  const FoodCategoriesWidget({super.key});

  @override
  _FoodCategoriesWidgetState createState() => _FoodCategoriesWidgetState();
}

class _FoodCategoriesWidgetState extends State<FoodCategoriesWidget> {
  // List of categories with icon assets and names
  final List<Map<String, dynamic>> categories = [
    {
      "icon": Icons.fastfood,
      "label": "Burger",
    },
    {
      "icon": Icons.local_pizza,
      "label": "Pizza",
    },
    {
      "icon": Icons.restaurant_menu,
      "label": "Fries",
    },
    {
      "icon": Icons.local_bar,
      "label": "Drinks",
    },
    {
      "icon": Icons.set_meal,
      "label": "Meat",
    },
  ];

  // Track the selected index
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
       const Text (
        "Top Category",
        style:TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
       ),
        const SizedBox(height: 16),
        // Horizontal List of Categories
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = index == selectedIndex;
    
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index; // Update selected index
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    children: [
                      // Circular icon container
                      Container(
                        width:isSelected?70:60,
                        height: isSelected?70:60,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? primaryColor
                              : Colors.grey[50], 
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          category["icon"],
                          size: 36,
                          
                        ),
                      ),
                    const   SizedBox(height: 8),
                      
                      Text(
                        category["label"],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.black : Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Text textContainer() {
    return Text(
      'Top Category',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 1.5,
        shadows: [
          Shadow(
            offset: const Offset(2, 2),
            blurRadius: 8,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  BoxDecoration containerDecoration() {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [primaryColor, secondColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
