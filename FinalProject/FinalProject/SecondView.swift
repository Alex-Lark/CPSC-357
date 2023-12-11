//
//  SecondView.swift
//  FinalProject
//
//  Created by Alex Lark on 12/7/23.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var taskListList: TaskListList
    @EnvironmentObject var currentTaskList: TaskList
    @EnvironmentObject var repeatsList: RepeatsList
    @State private var showEditTaskView = false
    @State private var currentTask: Task = Task(name: "error")
    @State var currentTaskNumber: Int = 0

    var body: some View {
        VStack{
            Text(taskListList.checkDateMatching()) //displays "Today"
                .font(.largeTitle)
            
            Text(currentTaskList.getDate()) //displays date
                .font(.headline)
    
            if (taskListList.getCurrentTaskList().getTaskList().count > 0){ //runs loop if there are tasks, prevents crashing
                ForEach((0...taskListList.getCurrentTaskList().getTaskList().count - 1), id: \.self){ task in //iterates through all tasks for the current day
                    HStack{
                        Button {
                            taskListList.getCurrentTaskList().getTask(number: task).toggleCompleted()
                            taskListList.getCurrentTaskList().triggerUpdate() //forces view to update
                        }label: {
                            if (!taskListList.getCurrentTaskList().getTask(number: task).getTaskCompleted()){ //empty square if task is not completed
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.black)
                                    .frame(width: 10, height: 10)
                            }
                            else{
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(Color.black)
                                    .foregroundColor(.black)
                                    .frame(width: 10, height: 10)
                            }
                        }
                        
                        /*if (taskListList.getCurrentTaskList().getTask(number: task).getRepeatsMonday()){
                            Text("Mondays")
                        }*/
                        VStack{
                            if (!taskListList.getCurrentTaskList().getTask(number: task).getTaskCompleted()){
                                Text(taskListList.getCurrentTaskList().getTask(number: task).getTaskName())
                            }
                            else{ //strikethrough's the text if the task is completed
                                Text(taskListList.getCurrentTaskList().getTask(number: task).getTaskName())
                                    .strikethrough(true, color: nil)
                            }
                        }.contextMenu{
                            Button("Edit"){
                                currentTaskNumber = task
                                self.showEditTaskView.toggle()
                            }
                            Button("Delete"){
                                currentTaskNumber = task
                                currentTaskList.deleteTask(number: currentTaskNumber)
                                if (task > 0){
                                    repeatsList.deleteRepeating(inputTask: taskListList.getCurrentTaskList().getTask(number: currentTaskNumber - 1))
                                }
                                
                            }
                        }
                    }.sheet(isPresented: $showEditTaskView){
                        EditTaskView(showEditTaskView: $showEditTaskView, taskListList: taskListList, taskNumber: $currentTaskNumber)
                    }
                }
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            else{ //prevents the view from moving when there are no tasks
                VStack{
                    Text("")
                }
                Spacer()
            }
        }
    }
}

class counterTest: ObservableObject{
    @Published var countTest: Int
    
    init(){
        countTest = 0
    }
}

/*struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}*/
