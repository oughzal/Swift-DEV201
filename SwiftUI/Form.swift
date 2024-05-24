import SwiftUI
struct ContentView: View {
    @State private var name: String = ""
    @State private var age: Int = 18
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informations personnelles")) {
                    TextField("Nom", text: $name)
                    Stepper("Âge: \(age)", value: $age, in: 18...100)
                }
                Section {
                    Button("Enregistrer") {
                        print("Informations enregistrées")
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}
