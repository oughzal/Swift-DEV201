import SwiftUI
struct ContentView: View {
    @State private var name: String = ""
    
    var body: some View {
        TextField("Entrez votre nom", text: $name)
            .padding()
    }
}
