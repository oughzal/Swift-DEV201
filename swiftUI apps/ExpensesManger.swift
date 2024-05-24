import SwiftUI

// Modèle pour les dépenses
struct ExpenseItem: Identifiable {
    let id = UUID()
    let description: String
    let amount: Double
    let category: String
}

// Vue principale
struct ContentView: View {
    @State private var expenses: [ExpenseItem] = []
    @State private var description = ""
    @State private var amount = ""
    @State private var category = ""

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Ajouter une nouvelle dépense")) {
                    TextField("Description", text: $description)
                    TextField("Montant", text: $amount)
                        .keyboardType(.decimalPad)
                    TextField("Catégorie", text: $category)
                    Button("Ajouter") {
                        addExpense()
                    }
                }
                
                Section(header: Text("Dépenses")) {
                    ForEach(expenses) { expense in
                        VStack(alignment: .leading) {
                            Text(expense.description)
                                .font(.headline)
                            Text("\(expense.amount, specifier: "%.2f") €")
                            Text(expense.category)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeExpenses)
                }
            }
            .navigationTitle("Suivi de Dépenses")
        }
    }
    
    func addExpense() {
        if let actualAmount = Double(amount) {
            let newItem = ExpenseItem(description: description, amount: actualAmount, category: category)
            expenses.append(newItem)
            clearFields()
        }
    }
    
    func removeExpenses(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
    }
    
    func clearFields() {
        description = ""
        amount = ""
        category = ""
    }
}

@main
struct ExpensesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
