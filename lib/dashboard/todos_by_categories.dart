import 'package:flutter/material.dart';
import 'package:todolist/helpers/todo_service.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/theme.dart';

class TodosByCategory extends StatefulWidget {
  final String? category;
  TodosByCategory({this.category});
  @override
  _TodosByCategoryState createState() => _TodosByCategoryState();
}

class _TodosByCategoryState extends State<TodosByCategory> {

  List<Todo> _todoList = <Todo>[];
  TodoService _todoService = TodoService();

  @override
  void initState(){
    super.initState();
    getTodosByCategories();
  }

  getTodosByCategories() async {
    var todos = await _todoService.readTodosByCategory(this.widget.category);
    todos.forEach((todo) {
      setState(() {
       var model = Todo();
       model.tittle = todo['tittle'];
       model.description = todo['description'];
       model.todoDate = todo['todoDate'];

       _todoList.add(model);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work List by Category', style: whiteTextStyle.copyWith(
          fontSize: 18,
          fontWeight:FontWeight.w700,
        )),
        backgroundColor: redColor,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Container(
              padding:EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: Offset(-3, 4)
                  )
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        if (_todoList[index].tittle.toString() == null)...[
                        Text("No Title",style :blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        )),
                      ] else...[
                        Text(_todoList[index].tittle.toString(),
                        style :blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        ))
                      ],
                      if (_todoList[index].description.toString() == null)...[
                        Text("No Description",
                        style :blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w300
                        )),
                      ]
                      // ] else...[
                      //   Text(_todoList[index].category.toString(),
                      //   style :blackTextStyle.copyWith(
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w300
                      //   ))
                      // ]
                      ],
                    ),

                    if (_todoList[index].todoDate.toString() == null)...[
                        Text("No Title",
                        style :blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        )),
                      ] else...[
                        Text(_todoList[index].todoDate.toString(),
                        style :blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        ))
                      ],
                  ],
                )
            ),
          );
        }
      ),
    );
  }
}