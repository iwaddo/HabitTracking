//
//  HabitView.swift
//  HabitTracking
//
//  Created by Ian Waddington on 21/01/2023.
//

import SwiftUI

struct HabitView: View {
    @ObservedObject var habits: Habits
    @State var habit: HabitItem

@State var copiedHabit = HabitItem(title: "", description: "", times: 0)

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("Title", text: $copiedHabit.title)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.vertical)


                    TextField("", text: $copiedHabit.description)
                    Text("\(copiedHabit.times)")
                        .font(.largeTitle)


                }
                HStack {
                    Spacer()
                    Button {
                        if copiedHabit.times > 0 {
                            copiedHabit.times -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                            .padding(25)
                            .background(.red)
                            .clipShape(Circle())
                    }

                    Spacer()
                    Button {
                        copiedHabit.times += 1
                    } label: {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                            .padding(25)

                            .background(.green)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
            }
        }
        .navigationTitle("Update Habit")
        .onAppear(perform: {
            copiedHabit.title = habit.title
            copiedHabit.description = habit.description
            copiedHabit.times = habit.times
        })
        .onDisappear(perform: {
            if let index = habits.items.firstIndex(of: habit) {
                habits.items[index] = copiedHabit
            }
        })

    }

}


struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(habits: Habits(), habit: HabitItem(title: "Test", description: "Test", times: 1))
    }
}
