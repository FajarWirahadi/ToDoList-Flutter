import 'package:todolist/models/category.dart';
import 'package:todolist/repositories/repository.dart';

class CategoryService{
  late Repository _repository;

  CategoryService() {
    _repository =Repository();
  }

  // Create data
  saveCategory(Category category) async{
    return await _repository.inserData('categories', category.categoryMap());
  }

  //Read data from table
  readCategories() async {
    return await _repository.readData('categories');
    
  }

  // Read data from table by Id
  readCategoryById(categoryId) async{
    return await _repository.readDataById('categories', categoryId);
  }

  // Update data form table
  updateCategory(Category category) async{
    return await _repository.updateData('categories', category.categoryMap());
  }

  // Delete data from table
  deleteCategory(categoryId) async{
    return await _repository.deleteDate('categories', categoryId);
  }
}