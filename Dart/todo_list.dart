// Task class to fill ToDoList
class Task {
  String description;
  bool complete;

  Task(this.description, this.complete);
}

// ToDoList class to simulate a todo list
class ToDoList {
  // Create a list to hold tasks
  List<Task> tasks = [];

  // Method to add a Task to the list
  void addTask(String description) {
    // call .add on tasks given description and set complete to false
    tasks.add(Task(description, false));
    // Print added msg
    print("Added: $description");
  }

  // Method to complete a Task
  void completeTask(int index) {
    // Validate the given index
    if (index >= 0 && index < tasks.length) {
      // Mark task as complete
      tasks[index].complete = true;
      // Print marked as complete msg
      print("Task ${index + 1} marked as complete.");
    }
    // Index is not valid
    else {
      print("Invalid task");
    }
  }

  // Method to display tasks in formatted way
  void displayTasks() {
    // Check if the list is empty
    if (tasks.isEmpty) {
      print("Todo List is empty");
    }
    // List is not empty so print tasks
    else {
      print("To-Do List:");
      for (int i = 0; i < tasks.length; i++) {
        // Use ternary operator to determine if a task is complete or not
        tasks[i].complete
            ? print("${i + 1}. [X] ${tasks[i].description}")
            : print("${i + 1}. [ ] ${tasks[i].description}");
      }
    }
  }
}

void main() {
  // Create a ToDoList
  var list = ToDoList();

  // Add the first two tasks
  list.addTask("Study, study, school's your buddy");
  list.addTask("Program Dart assignment");

  // Display the current tasks
  list.displayTasks();

  // Mark the first task as complete
  list.completeTask(0);

  // Display the current tasks
  list.displayTasks();

  // Add two more tasks
  list.addTask("Turn in Dart Assignment");
  list.addTask("Go home for summer");

  // Mark the fourth task as complete
  list.completeTask(3);

  // Display the current tasks
  list.displayTasks();
}
