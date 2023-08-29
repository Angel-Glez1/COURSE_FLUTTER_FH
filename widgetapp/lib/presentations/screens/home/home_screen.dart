import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetapp/config/menu/menu_items.dart';
import 'package:widgetapp/presentations/widgets/side_menu.dart';



class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();
 
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Widgets + Material 3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldkey: scaffoldKey,)

    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final menuItem = menuItems[index];
          return _CustomListTile(menuItem: menuItem) ;
        },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final themeColors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: themeColors.primary,),
      trailing: Icon(Icons.arrow_forward_ios_outlined, color: themeColors.primary,),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () => context.push(menuItem.link),
    );
  }
}