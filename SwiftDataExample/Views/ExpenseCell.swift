//
//  ExpenseCell.swift
//  SwiftDataExample
//
//  Created by XP India on 11/04/25.
//

import SwiftUI

struct ExpenseCell: View {
    let expense: Expense
    
    var body: some View {
        HStack {
            Section {
                Text(expense.date, format: .dateTime.month(.abbreviated).day())
                    .frame(width: 70, alignment: .leading)
                Text(expense.name)
                Spacer()
                Text(expense.value, format: .currency(code: "USD"))
            }
        }
    }
}
