import 'package:flutter/material.dart';
import 'package:todolist/helpers/category_service.dart';
import 'package:todolist/helpers/todo_service.dart';
import 'package:todolist/models/todo.dart';
import '../theme.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  var _todoTittleController =TextEditingController();
  var _todoDateController =TextEditingController();
  var _todoDescriptionController =TextEditingController();
  var _selectedValue;
  var _categories = <DropdownMenuItem<String>>[];

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  _loadCategories() async {
    var _categoryService = CategoryService();
    var categories = await _categoryService.readCategories();
    categories.forEach((category){
      setState(() {
       _categories.add(DropdownMenuItem(
         child: Text(category ['tittle']),
         value: category['tittle'], 
        ));
      });
    });
  }

  DateTime _dateTime = DateTime.now();

  _selectedTodoDate(BuildContext context) async{
    var _pickedDate = await showDatePicker(
      context:context, 
      initialDate: _dateTime, 
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100));

      if(_pickedDate!=null) {
        setState(() {
          _dateTime = _pickedDate;
          _todoDateController.text =DateFormat('yyyy-MM-dd').format(_pickedDate);
        });
      }
  }

  _showSuccessSnackBar(message){
    var _snackBar = SnackBar(content: message);
    _globalKey.currentState!.showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('New Task', style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500
            )),
            backgroundColor: redColor,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
              child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35),
                Container(
                  // height: 50,
                  width: 115,
                  child: DropdownButtonFormField(
                    value: _selectedValue,
                    items: _categories,
                    isDense: true,
                    isExpanded: true,
                    elevation: 16,
                    itemHeight: 75,
                    onChanged: (value) {
                      setState(() {
                       _selectedValue = value; 
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: greyColor,
                      filled: true,
                      labelText: 'Category',
                labelStyle: grey2TextStyle.copyWith(
                  fontSize: 14,
                  fontWeight:FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: whiteColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: whiteColor,
                        ),
                      ),
                    ),
                    style: grey2TextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis
                    ),
                    // onChanged: (value) {
                    //   setState(() {
                    //     _selectedValue = value;
                    //   });
                    // },
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _todoTittleController,
              keyboardType: TextInputType.visiblePassword,
              style: blackTextStyle.copyWith(fontSize: 14),
              decoration:InputDecoration(
                border: InputBorder.none,
                labelText: 'Tittle',
                labelStyle: grey2TextStyle.copyWith(
                  fontSize: 14,
                  fontWeight:FontWeight.w500,
                  decoration: TextDecoration.none
                ),
                fillColor: greyColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: whiteColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: whiteColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: redColor,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: redColor,
                  ),
                )
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
                  controller: _todoDescriptionController,
              keyboardType: TextInputType.visiblePassword,
              style: blackTextStyle.copyWith(fontSize: 14),
              decoration:InputDecoration(
                border: InputBorder.none,
                labelText: 'Description...',
                labelStyle: grey2TextStyle.copyWith(
                  fontSize: 14,
                  fontWeight:FontWeight.w500,
                  decoration: TextDecoration.none
                ),
                fillColor: greyColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: whiteColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: whiteColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: redColor,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: redColor,
                  ),
                )
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
                  controller: _todoDateController,
              keyboardType: TextInputType.visiblePassword,
              style: blackTextStyle.copyWith(fontSize: 14),
              decoration:InputDecoration(
                prefixIcon: InkWell(
                  onTap: () {
                    _selectedTodoDate(context);
                  },
                  child: Icon(Icons.calendar_today, color: projectsBlueColor),
                ),
                border: InputBorder.none,
                hintText: 'Pick a Date',
                fillColor: greyColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: whiteColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: whiteColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: redColor,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: redColor,
                  ),
                )
              ),
            ),
      
            SizedBox(height: 35),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 55,
              child: RaisedButton(
                color:redColor,
                // color: (todoTittleController.text.isNotEmpty &&
                //         todoDescriptionController.text.isNotEmpty &&
                //         todoDateController.text.isNotEmpty) ? redColor : greyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  
                ),
                child: Text(
                  'Add Task',
                  style: whiteTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () async{
                  var todoObject = Todo();

                  todoObject.tittle =_todoTittleController.text;
                  todoObject.description =_todoDescriptionController.text;
                  todoObject.isFinished = 0;
                  todoObject.category = _selectedValue.toString();
                  todoObject.todoDate =_todoDateController.text;

                  var _todoService = TodoService();
                  var result = await _todoService.saveTodo(todoObject);
                  if (result > 0) {
                    _showSuccessSnackBar(
                    Text('Added!'));
                  Navigator.pop(context);
                  
                  
                }
              },
                
              ),
            ),
        ],
      ),
              ),
          ),
    );
  }
}