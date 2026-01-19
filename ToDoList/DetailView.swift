//
//  DetailView.swift
//  ToDoList
//
//  Created by Kiran Shrestha on 1/19/26.
//

import SwiftUI

struct DetailView: View {
    @State var toDo : String
    @State private var reminderIsOn = false
//    @State private var dueDate = Date.now + (60*60*24)
    @State private var dueDate = Calendar.current.date(byAdding: .day, value: 1, to: .now)!
    @State private var notes = ""
    @State private var isCompleted = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            TextField("Enter To Do Here", text: $toDo)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Set Reminder:", isOn: $reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            
            DatePicker("Date:", selection: $dueDate)
                .listRowSeparator(.hidden)
                .disabled(!reminderIsOn)
            
            Text("Notes:")
                .padding(.top)
            TextField("Notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Completed:", isOn: $isCompleted)
                .padding(.top)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel"){
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save"){
                    //TODO: ACTION
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack{
        DetailView(toDo: "Example Passed In")
    }
}
