//
//  EditView.swift
//  FinalProject
//
//  Created by Alex Lark on 12/9/23.
//

import SwiftUI

struct EditTaskView: View {
    @Binding var showEditTaskView: Bool
    @StateObject var taskListList: TaskListList
    @Binding var taskNumber: Int
    @State private var taskName: String = "test"
    @State private var taskRepeats: Bool = false
    @State private var repeatsM: Bool = false
    @State private var repeatsTu: Bool = false
    @State private var repeatsW: Bool = false
    @State private var repeatsTh: Bool = false
    @State private var repeatsF: Bool = false
    @State private var repeatsS: Bool = false
    @State private var repeatsSu: Bool = false
    
    var body: some View {
        VStack{
            Text("Edit Task")
                .font(.largeTitle)
                .padding(.vertical, 20)
            HStack{
                Text("Task Name: ")
                TextField("Task", text: $taskName)
            }.padding(.vertical, 20)
            Toggle("Repeat", isOn: $taskRepeats)
            if (taskRepeats){
                Toggle("M", isOn: $repeatsM)
                Toggle("Tu", isOn: $repeatsTu)
                Toggle("W", isOn: $repeatsW)
                Toggle("Th", isOn: $repeatsTh)
                Toggle("F", isOn: $repeatsF)
                Toggle("S", isOn: $repeatsS)
                Toggle("Su", isOn: $repeatsSu)
            }
        }
        Spacer()
            .padding()
        Button("Done"){ //To Do: implement repition updates
            taskListList.getCurrentTaskList().getTask(number: taskNumber).setTaskName(name: taskName)
            taskListList.getCurrentTaskList().triggerUpdate()
            self.showEditTaskView = false
        }.onAppear { //sets variables to the proper value
            taskName = taskListList.getCurrentTaskList().getTask(number: taskNumber).getTaskName()
            taskRepeats = taskListList.getCurrentTaskList().getTask(number: taskNumber).getRepeats()
            print(taskListList.getCurrentTaskList().getTask(number: taskNumber).getRepeats())
            repeatsM = taskListList.getCurrentTaskList().getTask(number: taskNumber).getRepeatsMonday()
            repeatsTu = taskListList.getCurrentTaskList().getTask(number: taskNumber).getRepeatsTuesday()
            repeatsW = taskListList.getCurrentTaskList().getTask(number: taskNumber).getRepeatsWednesday()
            repeatsTh = taskListList.getCurrentTaskList().getTask(number: taskNumber).getRepeatsThursday()
            repeatsF = taskListList.getCurrentTaskList().getTask(number: taskNumber).getRepeatsFriday()
            repeatsS = taskListList.getCurrentTaskList().getTask(number: taskNumber).getRepeatsSaturday()
            repeatsSu = taskListList.getCurrentTaskList().getTask(number: taskNumber).getRepeatsSunday()
        }
    }
}

/*#Preview {
    EditView()
}*/
