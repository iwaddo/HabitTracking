//
//  AddView.swift
//  HabitTracking
//
//  Created by Ian Waddington on 21/01/2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var description = ""
    @State private var times = 0

    var body: some View {
        NavigationStack {
            Form {
                Text("Habit")
                    .font(.title)
                TextField("Habit", text: $title)

                Text("Description")
                    .font(.title)
                TextEditor(text: $description)

                HStack {
                    Text("Count")
                        .font(.title)

                    TextField("Count", value: $times, format: .number)
                    Image(systemName: "minus")
                        .onTapGesture {
                            if times == 0 {
                                times = 0
                            } else {
                                times -= 1
                            }
                        }
                    Image(systemName: "plus")
                        .onTapGesture {
                            times += 1
                        }
                }
            }
            Spacer()
            Text("Enter a Title and a Count of at least One")
                .font(.caption)
                .italic()


            .navigationTitle("Add New Habit")
            .toolbar {
                Button("Save") {
                    if times == 0 || title == "" {
                        dismiss()
                    } else {
                        let item = HabitItem(title: title, description: description, times: times)
                        habits.items.append(item)
                        dismiss()
                    }
                }
                    Button("Cancel") {
                        dismiss()
                    }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
