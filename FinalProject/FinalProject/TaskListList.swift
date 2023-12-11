//
//  ToDoListList.swift
//  FinalProject
//
//  Created by Alex Lark on 12/6/23.
//

import Foundation
import Combine

class TaskListList: ObservableObject{ //list of all To Do Lists
    var taskListDict: [String: TaskList] = [:] //dictionary of all task lists, sorted by dateString
    var todaysDate: Date = Date() //current calender date
    var todaysDateString: String = "" //string of the current calender date
    var currentDate: Date //date that is currently selected
    @Published var currentDateString: String = "" //string of the currently selected date
    
    init(){ //initializer
        currentDate = todaysDate
        currentDateString = dateToString(date: todaysDate)
        todaysDateString = dateToString(date: todaysDate)
        taskListDict.updateValue(TaskList(date: todaysDateString), forKey: currentDateString)
    }
    
    func getCurrentDate() -> Date{ //getter method for current date
        return currentDate
    }
    
    func getCurrentDateString() -> String{ //getter method for current date in string format
        return currentDateString
    }
    
    func getCurrentTaskList() -> TaskList{ //getter method for the current TaskList
        return taskListDict[currentDateString, default: TaskList(date: "error")]
    }
    
    func checkDateMatching() -> String{ //returns true if the currently displayed date matches todaysdate
        if (currentDate == todaysDate){
            return "Today"
        }
        else{
            return ""
        }
    }
    
    func nextDate(repeatsList: RepeatsList){ //moves to the next date, adding a new taskList as needed
        incrementDate()
        if (taskListDict.index(forKey: currentDateString) == nil){
            addTaskList()
        }
        if (currentDate > todaysDate){
            addRepeatingTasks(repeatsList: repeatsList)
        }
    }
    
    func previousDate(){ //moves to the previous date, adding a new taskList as needed
        decrementDate()
        if (taskListDict.index(forKey: currentDateString) == nil){
            addTaskList()
        }
    }
    
    func addTaskList(){ //adds a new to do List to the dictionary. precondition: list at current date does not exist
        taskListDict.updateValue(TaskList(date: currentDateString), forKey: currentDateString)
    }
    
    func addRepeatingTasks(repeatsList: RepeatsList){ //adds repeating tasks to the current list
        if (currentDateString.contains("Monday")){
            addRepeatingTasksMonday(repeatsList: repeatsList)
        }
        if (currentDateString.contains("Tuesday")){
            addRepeatingTasksTuesday(repeatsList: repeatsList)
        }
        if (currentDateString.contains("Wednesday")){
            addRepeatingTasksWednesday(repeatsList: repeatsList)
        }
        if (currentDateString.contains("Thursday")){
            addRepeatingTasksThursday(repeatsList: repeatsList)
        }
        if (currentDateString.contains("Friday")){
            addRepeatingTasksFriday(repeatsList: repeatsList)
        }
        if (currentDateString.contains("Saturday")){
            addRepeatingTasksSaturday(repeatsList: repeatsList)
        }
        if (currentDateString.contains("Sunday")){
            addRepeatingTasksSunday(repeatsList: repeatsList)
        }
    }
    
    func addRepeatingTasksMonday(repeatsList: RepeatsList){ //adds repeating monday tasks to the current list
        for repeatingTask in repeatsList.getRepeatsMondays(){
            if (!getCurrentTaskList().contains(tempTask: repeatingTask)){
                getCurrentTaskList().addTask(tempTask: repeatingTask)
            }
        }
    }
    func addRepeatingTasksTuesday(repeatsList: RepeatsList){
        for repeatingTask in repeatsList.getRepeatsTuesdays(){
            if (!getCurrentTaskList().contains(tempTask: repeatingTask)){
                getCurrentTaskList().addTask(tempTask: repeatingTask)
            }
        }
    }
    func addRepeatingTasksWednesday(repeatsList: RepeatsList){
        for repeatingTask in repeatsList.getRepeatsWednesdays(){
            if (!getCurrentTaskList().contains(tempTask: repeatingTask)){
                getCurrentTaskList().addTask(tempTask: repeatingTask)
            }
        }
    }
    func addRepeatingTasksThursday(repeatsList: RepeatsList){
        for repeatingTask in repeatsList.getRepeatsThursdays(){
            if (!getCurrentTaskList().contains(tempTask: repeatingTask)){
                getCurrentTaskList().addTask(tempTask: repeatingTask)
            }
        }
    }
    func addRepeatingTasksFriday(repeatsList: RepeatsList){
        for repeatingTask in repeatsList.getRepeatsFridays(){
            if (!getCurrentTaskList().contains(tempTask: repeatingTask)){
                getCurrentTaskList().addTask(tempTask: repeatingTask)
            }
        }
    }
    func addRepeatingTasksSaturday(repeatsList: RepeatsList){
        for repeatingTask in repeatsList.getRepeatsSaturdays(){
            if (!getCurrentTaskList().contains(tempTask: repeatingTask)){
                getCurrentTaskList().addTask(tempTask: repeatingTask)
            }
        }
    }
    func addRepeatingTasksSunday(repeatsList: RepeatsList){
        for repeatingTask in repeatsList.getRepeatsSundays(){
            if (!getCurrentTaskList().contains(tempTask: repeatingTask)){
                getCurrentTaskList().addTask(tempTask: repeatingTask)
            }
        }
    }
    
    func resetDate(){ //resets currentdate to match todays date
       currentDate = todaysDate
        currentDateString = todaysDateString
    }
    
    func dateToString(date: Date) -> String{ //takes in date and returns formatted string of that date
            let dateFormatter : DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "eeee, MMM dd, yyyy"
            let tempDate = dateFormatter.string(from: date)
            return tempDate
        }
    
    
    func incrementDate(){ //increases current date by 1
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "eeee, MMM dd, yyyy"
        let tempDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        currentDate = tempDate
        currentDateString = dateFormatter.string(from: tempDate)
    }
    
    func decrementDate(){ //decrements current date by 1
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "eeee, MMM dd, yyyy"
        let tempDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
        currentDate = tempDate
        currentDateString = dateFormatter.string(from: tempDate)
    }
    
}
