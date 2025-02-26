class TodoModel {
  String title;
  bool isDone;

  TodoModel({
    required this.title,
    this.isDone = false,
  });
}

List<TodoModel> todosList = [
  TodoModel(title: 'Buy milk'),
  TodoModel(title: 'Buy eggs'),
  TodoModel(title: 'Buy bread'),
];
