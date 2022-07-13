import 'package:flutter/material.dart';
import 'package:todolist/dashboard/categorylistpage.dart';
import 'package:todolist/dashboard/home_screen.dart';
import 'package:todolist/dashboard/todos_by_categories.dart';
import 'package:todolist/helpers/category_service.dart';
import 'package:todolist/models/category.dart';
import 'package:todolist/repositories/repository.dart';
import 'package:todolist/repositories/database_connection.dart';
import '../theme.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
List<Widget> _categoryList = <Widget>[];

CategoryService _categoryService = CategoryService();

@override
initState(){
  super.initState();
  getAllCategories();
}

getAllCategories() async {
  var categories = await _categoryService.readCategories();

  categories.forEach((category) {
    setState(() {
     _categoryList.add(InkWell(
       onTap: () => Navigator.push(context, MaterialPageRoute(
         builder: (context) => new TodosByCategory(category: category['tittle']),
       )),
            child: ListTile(
         title: Text(category['tittle']),
       ),
     ));
    });
  });
}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home, color: redColor,),
              title: Text('Home'),
              onTap:() {
                Navigator.push(context, MaterialPageRoute(
                  builder:(context) => HomeScreen(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list, color: redColor,),
              title: Text('Categories'),
              onTap:() {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => CategoryListPage(),
                ));
              },
            ),
            Divider(),
            Column(
              children: _categoryList,
            ),
          ],
        ),
      ),
    );
  }
}