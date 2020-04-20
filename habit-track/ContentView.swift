//
//  ContentView.swift
//  habit-track
//
//  Created by Vlad Vrublevsky on 20.04.2020.
//  Copyright © 2020 Vlad Vrublevsky. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var AllHabits: Habits
    
    var body: some View {
        NavigationView {
            List(AllHabits.habits) { habit in
                NavigationLink(
                    destination: HabitDetail(habit: habit),
                               label: { HabitPreview(habit: habit) } )
            }
        .navigationBarTitle("Habit-Track")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Habits())
    }
}
