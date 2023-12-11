//
//  RepeatsList.swift
//  FinalProject
//
//  Created by Alex Lark on 12/9/23.
//

import Foundation

class RepeatsList: ObservableObject{
    var repeatsMondays: [Task] = []
    var repeatsTuesdays: [Task] = []
    var repeatsWednesdays: [Task] = []
    var repeatsThursdays: [Task] = []
    var repeatsFridays: [Task] = []
    var repeatsSaturdays: [Task] = []
    var repeatsSundays: [Task] = []
    
    init(){ //basic initializer
        
    }
    
    func addRepeating(task: Task){ //adds a new task to the list of repeating tasks
        if (task.getRepeats()){
            if (task.getRepeatsMonday()){
                repeatsMondays.append(task)
            }
            if (task.getRepeatsTuesday()){
                repeatsTuesdays.append(task)
            }
            if (task.getRepeatsWednesday()){
                repeatsWednesdays.append(task)
            }
            if (task.getRepeatsThursday()){
                repeatsThursdays.append(task)
            }
            if (task.getRepeatsFriday()){
                repeatsFridays.append(task)
            }
            if (task.getRepeatsSaturday()){
                repeatsSaturdays.append(task)
            }
            if (task.getRepeatsSunday()){
                repeatsSundays.append(task)
            }
        }
    }
    
    func getRepeatsMondays() -> [Task]{ //returns the list of items that repeat mondays
        return repeatsMondays
    }
    func getRepeatsTuesdays() -> [Task]{
        return repeatsTuesdays
    }
    func getRepeatsWednesdays() -> [Task]{
        return repeatsWednesdays
    }
    func getRepeatsThursdays() -> [Task]{
        return repeatsThursdays
    }
    func getRepeatsFridays() -> [Task]{
        return repeatsFridays
    }
    func getRepeatsSaturdays() -> [Task]{
        return repeatsSaturdays
    }
    func getRepeatsSundays() -> [Task]{
        return repeatsSundays
    }
    
    
    func deleteRepeating(inputTask: Task){ //returns if inputTask is already present //does not work properly, other days to be implemented when fixed
        if (inputTask.getRepeats()){
            if (inputTask.getRepeatsMonday()){
                for i in 0...repeatsMondays.count - 1{
                    if repeatsMondays[i].equals(inputTask: inputTask){
                        repeatsMondays.remove(at: i)
                    }
                }
            }
            if (inputTask.getRepeatsTuesday()){
                for i in 0...repeatsTuesdays.count - 1{
                    if repeatsTuesdays[i].equals(inputTask: inputTask){
                        repeatsTuesdays.remove(at: i)
                    }
                }
            }
        }
    }
}
