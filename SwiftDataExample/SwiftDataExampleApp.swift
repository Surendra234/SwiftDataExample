//
//  SwiftDataExampleApp.swift
//  SwiftDataExample
//
//  Created by XP India on 11/04/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExampleApp: App {
 
    let container: ModelContainer = {
        let schema = Schema([Expense.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(container)
        }
    }
}
