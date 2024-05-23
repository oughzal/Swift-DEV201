import SwiftUI
struct ContentView: View {
    @State private var selectedOption: String = "Option 1"
    let options = ["Option 1", "Option 2", "Option 3"]
    var body: some View {
        Picker("Choisissez une option", selection: $selectedOption) {
            ForEach(options, id: \.self) { option in
                Text(option).tag(option)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}
