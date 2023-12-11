//
//  ToDoList.swift
//  FinalProject
//
//  Created by Alex Lark on 12/6/23.
//

import Foundation

class TaskList: Identifiable, ObservableObject, Hashable { //contains all tasks for a single day
    
    var date: String = "" //date in string format
    @Published var taskList: [Task] = []
    let id = UUID()
    
    init(date: String){ //initializer 
        self.date = date
        //taskList.append(Task(name: "test1"))
        //taskList.append(Task(name: "test2"))
    }
    
    func getDate() -> String{ //getter method for date associated with taskList
        return date
    }
    
    func getTaskList() -> [Task]{ //getter method for the taskList
        return taskList
    }
    
    func getTask(number: Int) -> Task{ //getter method for a Task at number in taskList
        return taskList[number]
    }
    
    func completeTask(number: Int){ //toggles task completion
        taskList[number].toggleCompleted()
    }
    
    func deleteTask(number: Int){ //deletes a task from the list
        taskList.remove(at: number)
    }
    
    func triggerUpdate(){ //forces the view to update
        taskList.append(Task(name: ""))
        taskList.remove(at: taskList.count - 1)
    }
    
    func addTask(name: String, R: Bool, M: Bool, Tu: Bool, W: Bool, Th: Bool, F: Bool, S: Bool, Su: Bool){ //adds a new task to the list
        taskList.append(Task(name: name, R: R, M: M, Tu: Tu, W: W, Th: Th, F: F, S: S, Su: Su))
    }
    
    func addTask(tempTask: Task){ //adds a new task given a task
        taskList.append(Task(tempTask: tempTask))
    }
    
    func contains(tempTask: Task) -> Bool{ //returns if tempTask is already present in the list
        for task in taskList{
            if (task.equals(inputTask: tempTask)){
                return true
            }
        }
        return false
    }
    
    func hash(into hasher: inout Hasher) { //allows TaskList to be present in dictionary
            hasher.combine(ObjectIdentifier(self))
        }
    static func ==(lhs: TaskList, rhs: TaskList) -> Bool { //allows TaskList to be present in dictionary
            return lhs === rhs
        }
    
}

