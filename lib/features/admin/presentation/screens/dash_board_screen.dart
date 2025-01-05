import 'package:flutter/material.dart';
import 'package:order_app/features/admin/presentation/screens/change_role.dart';
import 'package:order_app/features/admin/presentation/screens/products_admin_view.dart';
import 'package:order_app/features/admin/presentation/screens/shop_screen_admin.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  bool isExpanded = false;
  int? selectedShop;
  int selectedIndex = 0; // Track selected navigation tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Navigation Rail
          NavigationRail(
            extended: isExpanded,
            backgroundColor: Colors.deepPurple.shade400,
            unselectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedLabelTextStyle: const TextStyle(color: Colors.white),
            selectedIconTheme: IconThemeData(color: Colors.deepPurple.shade900),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.shop),
                label: Text("Shops"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.notifications),
                label: Text("Notifications"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.change_circle),
                label: Text("Change Role"),
              ),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
                selectedShop = null; // Reset shop selection when switching tabs
              });
            },
          ),

          // Right Content
          Expanded(
            child: Column(
              children: [
                // App Bar/Menu
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                      ),
                      const Spacer(),
                      Text(
                        _getHeaderTitle(),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Divider(),

                // Content Area
                Expanded(
                  child: _getContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Returns the header title based on the selected index
  String _getHeaderTitle() {
    if (selectedIndex == 0) {
      return selectedShop == null ? 'Shops' : 'Products for $selectedShop';
    } else if (selectedIndex == 1) {
      return 'Notifications';
    } else if (selectedIndex == 2) {
      return 'Change Role';
    }
    return '';
  }

  /// Returns the appropriate content based on the selected index
  Widget _getContent() {
    switch (selectedIndex) {
      case 0:
        return selectedShop == null
            ? const  ShopScreenAdmin()
            : ProductsAdminView(
                onBack: () {
                  setState(() {
                    selectedShop = null;
                  });
                },
              );
      case 1:
        return const Center(child: Text('Notifications Content'));
      case 2:
        return const ChangeRoleView();
      default:
        return const Center(child: Text('Unknown Section'));
    }
  }
}
