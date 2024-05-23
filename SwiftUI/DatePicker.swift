import SwiftUI
struct ContentView: View {
    @State private var selectedDate = Date()
    var body: some View {
        DatePicker("Sélectionnez une date", selection: $selectedDate, displayedComponents: .date)
            .padding()
    }
}
