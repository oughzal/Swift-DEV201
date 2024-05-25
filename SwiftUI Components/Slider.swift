import SwiftUI
struct ContentView: View {
    @State private var value: Double = 50
    var body: some View {
        VStack {
            Slider(value: $value, in: 0...100)
            Text("Valeur actuelle : \(value, specifier: "%.1f")")
        }
        .padding()
    }
}

@main
struct SliderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
