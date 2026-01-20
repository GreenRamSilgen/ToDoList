//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Kiran Shrestha on 1/19/26.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .modelContainer(for: ToDo.self)
        }
    }
    
    init() {
        print("SQL PATH")
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
        print("SQL PATH")
    }
}
