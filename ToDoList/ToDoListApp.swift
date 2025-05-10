//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by christine j on 5/9/25.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
