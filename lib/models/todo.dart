class Todo{
  int? id;
  String? tittle;
  String? description;
  String? category;
  String? todoDate;
  int? isFinished;

  todoMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['tittle'] = tittle;
    mapping['description'] = description;
    mapping['category'] = category;
    mapping['todoDate'] = todoDate;
    mapping['isFinished'] = isFinished;

    return mapping;
  }
}