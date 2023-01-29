//
//  ContentView.swift
//  HabitTracking
//
//  Created by Ian Waddington on 21/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var showingAddHabit = false

    var body: some View {
        NavigationStack {
            Form {
                ForEach(habits.items) { item in
                    NavigationLink {
                        HabitView(habits: habits, habit: item)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.description)
                                .padding(.top, 5)
                            HStack {
                                Text("\(item.times == 1 ? "Completed 1 time " : "Completed \(item.times) times")")
                            }
                            .padding(.top, 5)
                        }
                        .padding(.vertical)
                        .foregroundColor(.white)
                        .background(.lightBackground)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habits")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddView(habits: habits)
            }

        }

    }

    func removeItems(at offset: IndexSet) {
        habits.items.remove(atOffsets: offset)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Habits())
    }
}
