import SwiftUI

struct ContentView: View {
    @State private var isChecked: Bool = false

    var body: some View {
        Toggle("Accepter les termes", isOn: $isChecked)
            .padding()
    }
}
