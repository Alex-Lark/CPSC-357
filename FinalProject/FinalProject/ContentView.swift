//
//  ContentView.swift
//  FinalProject
//
//  Created by Alex Lark on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 2
    @StateObject var taskListList = TaskListList()
    @StateObject var repeatsList = RepeatsList()
    @State private var showAddTaskView = false
    /*@Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors:[]) private var tasksCD: FetchedResults<TaskCD>*/
    var body: some View {
        @StateObject var currentTaskList = taskListList.getCurrentTaskList()
        /*VStack{
            Text("Test")
            List{
                ForEach(tasksCD, id:\.self){ task in
                    //NavigationLink(destination:
                    VStack{
                        Text(task.name ?? "untitled")
                    }
                }
            }
        }*/
        VStack{
            HStack{
                Button("Home"){ //returns to "Today"
                    taskListList.resetDate()
                }.padding()
                Spacer()
                Button("Add Task"){
                    self.showAddTaskView.toggle()
                    
                }.padding()
                .sheet(isPresented: $showAddTaskView){ //displays add task view
                   AddTaskView(showAddTaskView: $showAddTaskView, taskListList: taskListList, repeatsList: repeatsList)
                }
            }
                TabView(selection: $selection) {
                    ViewOne()
                        .tabItem {
                        }.tag(1)
                    SecondView()
                        .tabItem{
                        }.tag(2)
                    ViewThree()
                        .tabItem {
                        }.tag(3)
                }
                .environmentObject(taskListList)
                .environmentObject(currentTaskList)
                .environmentObject(repeatsList)
                .tabViewStyle(PageTabViewStyle())
                .onChange(of: selection){newValue in //returns to SecondView for infinite scrolling
                    if (selection == 1){
                        taskListList.previousDate()
                    }
                    else if (selection == 3){
                        taskListList.nextDate(repeatsList: repeatsList)
                    }
                    selection = 2
                }
        }
    }
}
    
    struct ViewOne: View{
        var body: some View{
            Text("View One")
        }
    }
    
    struct ViewThree: View{
        var body: some View{
            Text("View Three")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

