import SwiftUI

struct AreaCalculatorView: View {
    @State private var length = ""
    @State private var width = ""
    @State private var area = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Longueur", text: $length)
                    .keyboardType(.decimalPad)
                TextField("Largeur", text: $width)
                    .keyboardType(.decimalPad)
                Button("Calculer la Surface") {
                    if let length = Double(length), let width = Double(width) {
                        let calculatedArea = length * width
                        area = "Surface: \(calculatedArea) unités carrées"
                    }
                }
                Text(area)
            }
            .navigationTitle("Calculateur de Surface")
        }
    }
}

@main
struct AreaApp: App {
    var body: some Scene {
        WindowGroup {
            AreaCalculatorView()
        }
    }
}
