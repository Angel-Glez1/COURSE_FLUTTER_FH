import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetapp/config/menu/menu_items.dart';


class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldkey; 

  const SideMenu({
    super.key,
    required this.scaffoldkey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        final menu = menuItems[value];
        context.push(menu.link);
        widget.scaffoldkey.currentState?.closeDrawer(); 
      },
      children:  [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
            child: const Text('Main') ,
          ),
          ...menuItems
            .sublist(0,3)
            .map((menuItem) => NavigationDrawerDestination(
                icon:  Icon(menuItem.icon), 
                label: Text(menuItem.title),
            ),    
          ).toList(),

          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Divider(),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
            child: const Text('Secondary') ,
          ),
          ...menuItems
            .sublist(3)
            .map((menuItem) => NavigationDrawerDestination(
                icon:  Icon(menuItem.icon), 
                label: Text(menuItem.title),
            ),    
          ).toList(),
       ],
    );
  }
}