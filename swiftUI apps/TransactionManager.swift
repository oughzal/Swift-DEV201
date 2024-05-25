import SwiftUI

// Modèle pour les transactions
struct Transaction: Identifiable {
    var id = UUID()
    var amount: Double
    var category: String // "Revenu" ou "Dépense"
    var description: String
}

// Vue principale de l'application
struct ContentView: View {
    @State private var transactions: [Transaction] = []
    @State private var newAmount: String = ""
    @State private var newCategory: String = "Dépense"
    @State private var newDescription: String = ""

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Nouvelle Transaction")) {
                    TextField("Montant", text: $newAmount)
                        .keyboardType(.decimalPad)
                    Picker("Catégorie", selection: $newCategory) {
                        Text("Revenu").tag("Revenu")
                        Text("Dépense").tag("Dépense")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    TextField("Description", text: $newDescription)
                    Button("Ajouter") {
                        addTransaction()
                    }
                }
                
                Section(header: Text("Transactions Récentes")) {
                    ForEach(transactions) { transaction in
                        VStack(alignment: .leading) {
                            Text(transaction.category)
                            Text(transaction.description)
                            Text(String(format: "%.2f €", transaction.amount))
                        }
                    }
                    .onDelete(perform: deleteTransaction)
                }
                
                Section(header: Text("Solde")) {
                    Text(String(format: "%.2f €", calculateBalance()))
                        .foregroundColor(calculateBalance() >= 0 ? .green : .red)
                }
            }
            .navigationTitle("Gestionnaire de Budget")
        }
    }

    func addTransaction() {
        guard let amount = Double(newAmount) else { return }
        let transaction = Transaction(amount: amount, category: newCategory, description: newDescription)
        transactions.append(transaction)
        newAmount = ""
        newDescription = ""
    }

    func deleteTransaction(at offsets: IndexSet) {
        transactions.remove(atOffsets: offsets)
    }

    func calculateBalance() -> Double {
        transactions.reduce(0) { (sum, transaction) in
            sum + (transaction.category == "Revenu" ? transaction.amount : -transaction.amount)
        }
    }
}

@main
struct BudgetManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
