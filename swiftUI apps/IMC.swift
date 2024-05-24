import SwiftUI

struct ContentView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var result: String = "Entrez votre poids et taille"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Votre Poids (en kg)")) {
                    TextField("Poids", text: $weight)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Votre Taille (en cm)")) {
                    TextField("Taille", text: $height)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Button("Calculer l'IMC") {
                        calculateBMI()
                    }
                }
                
                Section(header: Text("Résultat")) {
                    Text(result)
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle(" Calculateur d'IMC")
        }
    }
    
    // Fonction pour calculer l'IMC
    func calculateBMI() {
        guard let weightValue = Double(weight), let heightValue = Double(height) else {
            result = "Veuillez entrer des valeurs valides."
            return
        }
        
        if heightValue == 0 {
            result = "La taille ne peut pas être zéro."
            return
        }
        
        let heightInMeters = heightValue / 100
        let bmi = weightValue / (heightInMeters * heightInMeters)
        result = String(format: "Votre IMC est: %.2f", bmi)
    }
}
