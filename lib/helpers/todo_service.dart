import 'package:todolist/models/todo.dart';
import 'package:todolist/repositories/repository.dart';

class TodoService {
  late Repository _repository;

  TodoService() {
    _repository =Repository();
  }

  //create todos
  saveTodo(Todo todo) async{
    return await _repository.inserData('todos', todo.todoMap());
  }

  // Read todos
  readTodos() async {
    return await _repository.readData('todos');
  }

  //read toods by category
  readTodosByCategory(category) async{
    return await _repository.readDataByColumnName(
      'todos', 'category', category);
  }
}