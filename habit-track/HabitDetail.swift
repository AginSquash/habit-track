//
//  HabitDetail.swift
//  habit-track
//
//  Created by Vlad Vrublevsky on 20.04.2020.
//  Copyright © 2020 Vlad Vrublevsky. All rights reserved.
//

import SwiftUI

struct HabitDetail: View {
    @EnvironmentObject var AllHabits: Habits
    var habit: HabitEvent
    
    @State private var isAdding = false
    @State private var amountValue = String()
    
    var body: some View {
        Form {
            Section(header: Text("Habit name") ) {
                Text(habit.name)
            }
            Section(header: Text("Habit description")) {
                Text(habit.description)
            }
            Section(header: Text("Total time in habit"))
            {
                Text("\(habit.totalTime) minutes")
                Button(action: { withAnimation { self.isAdding.toggle() } },
                       label: { Text("Add time") } )
            }

            if isAdding {
                Section {
                    HStack {
                        TextField("Time", text: $amountValue, onCommit: addTime)
                            .keyboardType(.phonePad)
                        Button(action: { self.addTime() }, label: { Image(systemName: "plus.circle") } )
                    }
                }
                .transition(.slide)
            }
        }
        .navigationBarTitle("Habit", displayMode: .inline)
    }
    
    func addTime() {
        //need allert
        withAnimation {
            self.isAdding.toggle()
        }
        
        if let addingValue = try? Int(self.amountValue) {
            if let index = self.AllHabits.habits.firstIndex(where: { $0.id == self.habit.id }) {
                //Creating new object
                let updatedHabit = HabitEvent(id: self.habit.id, name: self.habit.name, description: self.habit.description, totalTime: self.habit.totalTime + addingValue)
                
                self.AllHabits.habits[index] = updatedHabit
                
            } else { fatalError("Not founded UUID") }
        }
        
        self.amountValue = String()
    }
}

struct HabitDetail_Previews: PreviewProvider {

    static var previews: some View {
        HabitDetail(habit: HabitEvent(name: "Playing", description: "Playing the game", totalTime: 20))
        //id: Habits().habits[0].id)

    }
}
