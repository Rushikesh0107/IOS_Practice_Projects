import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""

    var expenses: Expenses

    let types = ["Business", "Personal"]

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: String(amount))
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

//#Preview {
//    AddView(expenses: Expenses())
//}
