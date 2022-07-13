import 'package:flutter/material.dart';
import 'package:todolist/dashboard/todos_by_categories.dart';
import 'package:todolist/helpers/category_service.dart';
import 'package:todolist/helpers/drawer_navigation.dart';
import 'package:todolist/models/category.dart';

import '../theme.dart';
  

List<Color> colors = [
    projectsBlueColor,
    projectsPinkColor,
    projectsGreenColor,
    projectsPurpleColor,
    projectsYellowColor
  ];

class CategoryListPage extends StatefulWidget {


  // Category? category;
  
  // CategoryListPage ({this.category});
  
  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {

  var _categoryTittleController =TextEditingController();
  
  var _category = Category();
  var _categoryService = CategoryService();
  // List<Category> categories = Utils.getMockedCategories();
  List<Category> _categoryList = <Category>[];

  var category;

  var _editCategoryTittleController =TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  
  getAllCategories() async{
    _categoryList = <Category>[];
    var categories = await _categoryService.readCategories();
    categories.forEach((category){
      setState(() {
       var categoryModel = Category();
       categoryModel.tittle = category['tittle'];
       categoryModel.id = category['id'];
       _categoryList.add(categoryModel); 
      });
    }); 
  }

  _editCategory(BuildContext context, categoryId) async{
    category = await _categoryService.readCategoryById(categoryId);
    setState(() {
      _editCategoryTittleController.text = category[0]['tittle']??'No Tittle';
    });
    _editFormDialog(context);
  }

  _showFormDialog(BuildContext context) {
    return showDialog(context: context, barrierDismissible: true, builder: (param){
      return AlertDialog(
        title: Text('Categories Form'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tittle",
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1
                )),
              SizedBox(
                height: 5
              ),
              TextField(
                controller: _categoryTittleController,
                keyboardType: TextInputType.text,
                style: blackTextStyle.copyWith(fontSize: 14),
                decoration:InputDecoration(
                  border: InputBorder.none,
                  labelStyle: grey2TextStyle.copyWith(
                    fontSize: 14,
                    fontWeight:FontWeight.w500,
                    decoration: TextDecoration.none
                ),
                fillColor: greyColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: whiteColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: whiteColor,
                    ),
                  ),
              )),
            ],
          ),
        ),
        actions: [
          FlatButton(
            color: whiteColor,
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel",style:blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1
            )),
          ),
          
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: FlatButton(
              color: redColor,
              onPressed: () async{
                _category.tittle =_categoryTittleController.text;
                var result = await _categoryService.saveCategory(_category);
                print(result);
                Navigator.pop(context);
                getAllCategories();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              child: Text("Create", style:whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500
              )),
            ),
          ),
        ],
      );
    }); 
  }
  
  _editFormDialog(BuildContext context) {
    return showDialog(context: context, barrierDismissible: true, builder: (param){
      return AlertDialog(
        title: Text('Edit Categories Form', style: blackTextStyle.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1
        ),),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tittle",
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1
                )),
              SizedBox(
                height: 5
              ),
              TextField(
                controller: _editCategoryTittleController,
                keyboardType: TextInputType.text,
                style: blackTextStyle.copyWith(fontSize: 14),
                decoration:InputDecoration(
                  border: InputBorder.none,
                  labelStyle: grey2TextStyle.copyWith(
                    fontSize: 14,
                    fontWeight:FontWeight.w500,
                    decoration: TextDecoration.none
                ),
                fillColor: greyColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: whiteColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: whiteColor,
                    ),
                  ),
              )),
            ],
          ),
        ),
        actions: [
          FlatButton(
            color: whiteColor,
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel",style:blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1
            )),
          ),
          
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: FlatButton(
              color: redColor,
              onPressed: () async{
                _category.id = category[0]['id'];
                _category.tittle = _editCategoryTittleController.text;
                var result = await _categoryService.updateCategory(_category);
                if (result > 0) {
                  Navigator.pop(context);
                  getAllCategories();
                  _showSuccessSnackBar(
                    Text('Updated!'));
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              child: Text("Update", style:whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500
              )),
            ),
          ),
        ],
      );
    }); 
  }

  _deleteFormDialog(BuildContext context, categoryId) {
    return showDialog(context: context, barrierDismissible: true, builder: (param){
      return AlertDialog(
        title: Text('Are you sure you want to delete this category?', style: blackTextStyle.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.5
        )),
        actions: [
          FlatButton(
            color: whiteColor,
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel",style:blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1
            )),
          ),
          
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: FlatButton(
              color: redColor,
              onPressed: () async{

                var result = await _categoryService.deleteCategory(categoryId);
                if (result > 0) {
                  Navigator.pop(context);
                  getAllCategories();
                  _showSuccessSnackBar(
                    Text('Deleted!'));
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              child: Text("Delete", style:whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500
              )),
            ),
          ),
        ],
      );
    }); 
  }
  
  _showSuccessSnackBar(message){
    var _snackBar = SnackBar(content: message);
    _globalKey.currentState!.showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final double itemWidth = MediaQuery.of(context).size.width / 2;
    final double itemHeight = 150;
    return Scaffold(
      drawer: DrawerNavigation(),
      key: _globalKey,
      appBar: AppBar(
        title: Text('Projects',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700
          )),
          centerTitle: true,
        backgroundColor: redColor,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 6, top: 0, right: 12, bottom: 0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight ),
                children: List.generate(
                  _categoryList.length,
                  (index) {
                    return Container(
                      padding: EdgeInsets.all(18),
                      decoration:BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            spreadRadius: 0,
                            offset: Offset(-3, 4)
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: (_categoryList[index].id! % 2 == 0) ? projectsPinkBackground : projectsBlueBackground
                      ),
                      margin: EdgeInsets.all(12),
                      child: Stack(
                        children: [
                          // Container(
                          //   width: 15,
                          //   height: 15,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(50),
                          //     color: purpleColor,
                          //     boxShadow: [
                          //       BoxShadow(
                          //         color: purpleColor.withOpacity(0.5),
                          //         blurRadius: 8,
                          //         spreadRadius: 3,
                          //         offset: Offset(0, 0)
                          //       )
                          //     ],
                          //   )
                          // ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.all(0),
                                  alignment: Alignment.bottomRight,
                                  icon: Icon(Icons.edit, size: 30,),
                                  // color: redColor,
                                  onPressed: () {
                                    _editCategory(context, _categoryList[index].id);
                                  },
                                ),
                                IconButton(
                                  padding: EdgeInsets.all(0),
                                  alignment: Alignment.bottomRight,
                                  icon: Icon(Icons.delete, size: 30),
                                  color: redColor,
                                  onPressed: () {
                                    _deleteFormDialog(context, _categoryList[index].id);
                                  },
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: Text(
                             _categoryList[index].tittle.toString(),
                              style: blackTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            child: Text(
                              _categoryList.length.toString() + ' Tasks',
                              style: grey2TextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                   ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: 65,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () {
                    _showFormDialog(context);
                  },
                  child: Icon(Icons.add),
                  backgroundColor: redColor,
        ),
              ),
      ),
    );
  }
}
