//
//  ToDo.swift
//  FinalProject
//
//  Created by Alex Lark on 12/8/23.
//

import Foundation

class Task: ObservableObject{
    var taskName: String //name of the task
    @Published var taskCompleted: Bool = false
    @Published var repeats: Bool = false
    @Published var repeatsMonday: Bool = false
    @Published var repeatsTuesday: Bool = false
    @Published var repeatsWednesday: Bool = false
    @Published var repeatsThursday: Bool = false
    @Published var repeatsFriday: Bool = false
    @Published var repeatsSaturday: Bool = false
    @Published var repeatsSunday: Bool = false
    
    init(tempTask: Task){ //initializer taking in tempTask
        self.taskName = tempTask.getTaskName()
    }
    
    init(name: String){ //initializer
        self.taskName = name
    }
    
    init (name: String, R: Bool, M: Bool, Tu: Bool, W: Bool, Th: Bool, F: Bool, S: Bool, Su: Bool){ //initializer with repeating tasks
        self.taskName = name
        self.repeats = R
        self.repeatsMonday = M
        self.repeatsTuesday = Tu
        self.repeatsWednesday = W
        self.repeatsThursday = Th
        self.repeatsFriday = F
        self.repeatsSaturday = S
        self.repeatsSunday = Su
        
    }
    
    func getTaskName() -> String{ //getter method for taskName
        return taskName
    }
    
    func getTaskCompleted() -> Bool{ //getter method for if the task is completed
        return taskCompleted
    }
    
    func getRepeats() -> Bool{ //getter method for if the task repeats
        return repeats
    }
    func getRepeatsMonday() -> Bool{
        return repeatsMonday
    }
    func getRepeatsTuesday() -> Bool{
        return repeatsTuesday
    }
    func getRepeatsWednesday() -> Bool{
        return repeatsWednesday
    }
    func getRepeatsThursday() -> Bool{
        return repeatsThursday
    }
    func getRepeatsFriday() -> Bool{
        return repeatsFriday
    }
    func getRepeatsSaturday() -> Bool{
        return repeatsSaturday
    }
    func getRepeatsSunday() -> Bool{
        return repeatsSunday
    }
    
    func setTaskName(name: String){ //setter method for setting the task name
        taskName = name
    }
    
    func toggleCompleted(){ //toggles whether the task has been completed or not
        if (!taskCompleted){
            taskCompleted = true
        }
        else{
            taskCompleted = false
        }
    }
    
    func equals(inputTask: Task) -> Bool{ //returns if the input task equals the current task
        print("equals called")
        //if ((inputTask.getTaskName() == taskName) && (inputTask.getRepeats() == repeats) && (inputTask.getRepeatsMonday() == repeatsMonday) && (inputTask.getRepeatsTuesday() == repeatsTuesday) && (inputTask.getRepeatsWednesday() == repeatsWednesday) && (inputTask.getRepeatsThursday() == repeatsThursday) && (inputTask.getRepeatsFriday() == repeatsFriday) && (inputTask.getRepeatsSaturday() == repeatsSaturday) && (inputTask.getRepeatsSunday() == repeatsSunday)) {
        if ((inputTask.getTaskName() == taskName)){
            print("equal true")
            return true
        }
        //}
        else{
            return false
        }
    }
}
