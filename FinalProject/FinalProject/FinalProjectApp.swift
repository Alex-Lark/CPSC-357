//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Alex Lark on 12/5/23.
//

import SwiftUI

@main
struct FinalProjectApp: App {
    var body: some Scene {
        let persistentContainer = PersistentController.shared
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentContainer.container.viewContext)
        }
    }
}
