#  IOS APP Developement Final Project
Author - Alex Lark

Classes:
    Task:
        Contains variables for name, if it's completed, and if it repeats
    TaskList:
        List of tasks
        contains a variable for Date
    RepeatsList:
        Contains a list of tasks for each day of the week
        Lists are called on when creating new task Lists
    TaskListList:
        Contains a dictionary of task Lists
        task lists are sorted by the date they are associated with
        contains methods for getting the calender date and currently displayed date
        contains methods for creating new task Lists
Views:
    ContentView:
        Main View
        Controls swiping mechanism and currently displayed date
        has call to AddTaskView and has subview of SecondView
        creates TaskListList and RepeatsList variables
    AddTaskView:
        Adds a new task to the currently displayed taskList
    SecondView:
        displays tasks in the currently displayed taskList
        has checking mechanism
        has call to editTaskView
        lets users delete tasks
    EditTaskView:
        lets users edit specific tasks
CoreData: (not fully implemented) (most commented out code is CoreData)
    TaskData
    Persistance
