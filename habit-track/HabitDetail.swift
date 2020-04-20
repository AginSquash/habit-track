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
            }
            Section {
                Button(
                    action: {
                        if let index = self.AllHabits.habits.firstIndex(where: {$0.id == self.habit.id }) {
                            let updatedHabit = HabitEvent(id: self.habit.id, name: self.habit.name, description: self.habit.description, totalTime: self.habit.totalTime + 1)
                            self.AllHabits.habits[index] = updatedHabit
                        } else { fatalError("Not founded UUID") }
                        
                },
                    label: {Text("Change habit") })
            }
        }
        //.navigationBarTitle(habit.name)
            .navigationBarTitle("Habit", displayMode: .inline)
    }
}

struct HabitDetail_Previews: PreviewProvider {

    static var previews: some View {
        HabitDetail(habit: HabitEvent(name: "Name", description: "description", totalTime: 20))
        //id: Habits().habits[0].id)

    }
}
