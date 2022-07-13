import 'package:flutter/material.dart';
import 'package:todolist/dashboard/todo_screen.dart';
import 'package:todolist/helpers/drawer_navigation.dart';
import 'package:todolist/helpers/todo_service.dart';
import 'package:todolist/models/todo.dart';

import '../theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late TodoService _todoService;

  List<Todo> _todoList = <Todo>[];

  @override
  initState() {
    super.initState();
    getAllTodos();
  }

  getAllTodos() async {
    _todoService =TodoService();
    _todoList = <Todo>[];

    var todos = await _todoService.readTodos();
    todos.forEach((todo) {
      setState(() {
       var model = Todo();
       model.id = todo['id'];
       model.tittle = todo['tittle'];
       model.description = todo['tittle'];
       model.todoDate = todo['todoDate'];
       model.isFinished = todo['isFinished'];
       _todoList.add(model);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        title: Text('Work List', style: whiteTextStyle.copyWith(
          fontSize: 18,
          fontWeight:FontWeight.w700,
        )),
        backgroundColor: redColor,
        centerTitle: true,
      ),
      drawer: DrawerNavigation(),
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
                      if (_todoList[index].category.toString() == null)...[
                        Text("No Title",
                        style :blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w300
                        )),
                      ]
                      //  else...[
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
      floatingActionButton: Container(
        height: 65,
        width: 65,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => TodoScreen(),
              ));
            },
            child: Icon(Icons.add),
            backgroundColor: redColor,
          ),
        ),
      ),
    );
  }
}