//
//  AddTaskView.swift
//  FinalProject
//
//  Created by Alex Lark on 12/9/23.
//

import SwiftUI

struct AddTaskView: View { //view is called when add button is pressed
    @Binding var showAddTaskView: Bool //whether the view is displayed or not
    @StateObject var taskListList: TaskListList
    @StateObject var repeatsList: RepeatsList
    @State var taskName: String = "" 
    @State var taskRepeats: Bool = false
    @State var repeatsMonday: Bool = false
    @State var repeatsTuesday: Bool = false
    @State var repeatsWednesday: Bool = false
    @State var repeatsThursday: Bool = false
    @State var repeatsFriday: Bool = false
    @State var repeatsSaturday: Bool = false
    @State var repeatsSunday: Bool = false
    //@Environment(\.managedObjectContext) private var viewContext
    var body: some View{
        
        VStack{
            Text("Add Task")
                .font(.largeTitle)
                .padding(.vertical, 20)
            HStack{
                Text("Task Name:")
                TextField("Task Name", text: $taskName)
            }.padding(.vertical, 20)
            Toggle("Repeat", isOn: $taskRepeats)
             if (taskRepeats){
             Toggle("M", isOn: $repeatsMonday)
             Toggle("Tu", isOn: $repeatsTuesday)
             Toggle("W", isOn: $repeatsWednesday)
             Toggle("Th", isOn: $repeatsThursday)
             Toggle("F", isOn: $repeatsFriday)
             Toggle("S", isOn: $repeatsSaturday)
             Toggle("Su", isOn: $repeatsSunday)
             }
        }
        Spacer()
        .padding()
            Button("Done"){
                self.showAddTaskView = false
                if (taskName != ""){
                    //var tempTask = Task(name: taskName, R: taskRepeats, M: repeatsMonday, Tu: repeatsTuesday, W: repeatsWednesday, Th: repeatsThursday, F: repeatsFriday, S: repeatsSaturday, Su: repeatsSunday)
                    //taskListList.getCurrentTaskList().addTask(tempTask: tempTask)
                    taskListList.getCurrentTaskList().addTask(name: taskName, R: taskRepeats, M: repeatsMonday, Tu: repeatsTuesday, W: repeatsWednesday, Th: repeatsThursday, F: repeatsFriday, S: repeatsSaturday, Su: repeatsSunday)
                    repeatsList.addRepeating(task: Task(name: taskName, R: taskRepeats, M: repeatsMonday, Tu: repeatsTuesday, W: repeatsWednesday, Th: repeatsThursday, F: repeatsFriday, S: repeatsSaturday, Su: repeatsSunday))
                    //print(repeatsList.getRepeatsMondays()[0].getRepeats())
                    //print(repeatsList.getRepeatsMondays()[0].getRepeatsMonday())
                    /*let newTaskCD = TaskCD(context: viewContext)
                    newTaskCD.name = taskName
                    do{
                        try viewContext.save()
                    }
                    catch{
                        let error = error as NSError
                        fatalError("unresolved error:\(error)")
                    }*/
                }
            }
        }
    }

/*#Preview {
    AddTaskView(showAddTaskView: showAddTaskView)
}*/
