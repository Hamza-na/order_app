import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/core/constant/colors/colors.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int activeIndex = -1; // Track the active tile index (-1 means none is active)

  @override
  Widget build(BuildContext context) {
    final List<Icon> sideMenuIcons = [
      const Icon(Icons.home),
      const Icon(Icons.search),
      const Icon(Icons.star_border_outlined),
      const Icon(Icons.chat),
    ];
    final List<Icon> sideMenu2Icons = [
      const Icon(Icons.history),
      
    ];

    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: secondColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InfoCard(
                  name: 'UserName',
                  profession: 'Engineer',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                  child: Text(
                    "Browse".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                ...sideMenuIcons.asMap().entries.map((entry) {
                  int index = entry.key;
                  Icon icon = entry.value;
                  return SideMenuTile(
                    title: "home",
                    icon: icon,
                    isActive: activeIndex == index, // Pass the active state
                    onTap: () {
                      setState(() {
                        activeIndex = index; // Update the active tile
                      });
                    },
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                  child: Text(
                    "History".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                ...sideMenu2Icons.asMap().entries.map((entry) {
                  int index = entry.key + sideMenuIcons.length; 
                  Icon icon = entry.value;
                  return SideMenuTile(
                    title: "",
                    icon: icon,
                    isActive: activeIndex == index, 
                    onTap: () {
                      setState(() {
                        activeIndex = index; 
                      });
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    required this.icon,
    required this.isActive,
    required this.onTap,
    required this.title,

    super.key,
  });

  final Icon icon;
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.white24,
          height: 1,
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              height: 56,
              left: 0,
              width: isActive ? 288 : 0, // Toggle width
              child: Container(
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ListTile(
              onTap: onTap, // Call the callback when clicked
              leading: SizedBox(
                height: 32,
                width: 34,
                child: icon,
              ),
              title:  Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, 
    required this.name,
    required this.profession,
  });
  final String name, profession;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        profession,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
