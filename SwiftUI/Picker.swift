import SwiftUI
struct ContentView: View {
    @State private var selected: String = "Option 1"
    let options = ["Option 1", "Option 2", "Option 3"]
    var body: some View {
        Picker("Choisissez une option", selection: $selected) {
            ForEach(options, id: \.self) { option in
                Text(option).tag(option)
            }
        }
        .pickerStyle(SegmentedPickerStyle()).padding()
    }
}
