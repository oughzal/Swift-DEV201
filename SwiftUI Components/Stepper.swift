import SwiftUI

struct ContentView: View {
    @State private var age = 18

    var body: some View {
        VStack {
            Text("Âge: \(age)")
            Stepper("Modifier l'âge", value: $age, in: 0...100)
        }
        .padding()
    }
}
