//
//  ContentView.swift
//  ToDoList
//
//  Created by christine j on 5/9/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    @State private var showNewTask = false
    
    var body: some View {
        VStack {
            HStack {
                Text("To Do List")
//                    .font(.system(size: 40))
                    .font(.title)
                    .fontWeight(.black)
                Spacer()
                Button {
                    withAnimation {
                        showNewTask = true
                    }
                } label: {
                    Text("+")
                }
                .font(.title)
                .fontWeight(.bold)
            }
            .padding()
            Spacer()
            List {
                ForEach(toDos) { toDoItem in
                    if toDoItem.isImportant {
                        Text("‼️" + toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }
                }
                .onDelete(perform: deleteToDo)
            }
            .listStyle(.plain)
        }
        if showNewTask {
            NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false))

        }
    }
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self, inMemory: true)
}
