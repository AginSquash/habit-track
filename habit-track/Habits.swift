//
//  Habits.swift
//  habit-track
//
//  Created by Vlad Vrublevsky on 20.04.2020.
//  Copyright © 2020 Vlad Vrublevsky. All rights reserved.
//

import Foundation

class Habits: ObservableObject {
    @Published var habits = [HabitEvent]()
    
    init()
    {
        self.habits = [HabitEvent(name: "Play", description: "Test decs", totalTime: 120), HabitEvent(name: "Eating", description: "Test decs2", totalTime: 20)]
    }
}
