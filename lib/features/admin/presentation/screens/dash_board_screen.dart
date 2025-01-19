import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:order_app/features/admin/presentation/screens/change_role.dart';
import 'package:order_app/features/admin/presentation/screens/notification_screen.dart';
import 'package:order_app/features/products/presentation/widget/products_bloc_builder.dart';
import 'package:order_app/features/shops/presentation/widget/market_bloc_builder.dart';

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

          Expanded(
            child: Column(
              children: [
                // AppBar
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
      return selectedShop == null ? 'Shops' : 'Products for Shop $selectedShop';
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
            ? MarketBlocBuilder(
                isAdmin: true,
                onShopSelected: (shopId) {
                  setState(() {
                    selectedShop = shopId;
                  });
                },
              )
            : ProductsBlocBuilder(isAdmin: true);
      case 1:
        return BlocProvider(
          create: (context) => sl<AdminCubit>()..eitherFailureOrAdminNotification(),
          child: NotificationScreen(),
        );
      case 2:
        return const ChangeRoleView();
      default:
        return const Center(child: Text('Unknown Section'));
    }
  }
}
