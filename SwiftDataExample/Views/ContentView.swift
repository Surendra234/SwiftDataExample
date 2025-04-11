//
//  ContentView.swift
//  SwiftDataExample
//
//  Created by XP India on 11/04/25.
//

 /*

  Data Model :- Design the bussines logic to setup the data and used it in your project
  
  */

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var context
    @State private var isShowingItemSheet = false
    @Query(sort: \Expense.date) var expenses: [Expense]
    @State  private var expenseToEdit: Expense?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                        .highPriorityGesture(TapGesture().onEnded({ _ in
                            expenseToEdit = expense
                        }))
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(expenses[index])
                    }
                }
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet) {
                AddExpenseSheet()
                    .presentationDragIndicator(.visible)
            }
            .sheet(item: $expenseToEdit, content: { expense in
                UpdateExpenseSheet(expense: expense)
                    .presentationDragIndicator(.visible)
            })
            .toolbar {
                if !expenses.isEmpty {
                    Button("Add Expense", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView {
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    } description: {
                        Text("Start adding expenses to see your list.")
                    } actions: {
                        Button("Add Expense") { isShowingItemSheet = true}
                    }
                    .offset(y: -60)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
