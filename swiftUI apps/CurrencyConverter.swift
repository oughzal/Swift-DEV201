import SwiftUI

struct CurrencyConverterView: View {
    @State private var amount = ""
    @State private var result = ""
    let exchangeRate = 1.18  // Taux de conversion de l'EUR vers le USD

    var body: some View {
        NavigationView {
            Form {
                TextField("Montant en EUR", text: $amount)
                    .keyboardType(.decimalPad)
                Button("Convertir en USD") {
                    if let amountInEUR = Double(amount) {
                        let convertedAmount = amountInEUR * exchangeRate
                        result = String(format: "%.2f USD", convertedAmount)
                    }
                }
                Text(result)
            }
            .navigationTitle("Convertisseur de Devises")
        }
    }
}

@main
struct CurrencyApp: App {
    var body: some Scene {
        WindowGroup {
            CurrencyConverterView()
        }
    }
}
