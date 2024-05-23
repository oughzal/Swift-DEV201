//  SwiftUI ne possède pas de widget spécifique pour les boutons radio, mais vous pouvez les simuler en utilisant des boutons
import SwiftUI

struct ContentView: View {
    @State private var selectedOption: String = "A"
    let options = ["A", "B", "C"]

    var body: some View {
        VStack {
            ForEach(options, id: \.self) { option in
                HStack {
                    Text(option)
                    Spacer()
                    Image(systemName: selectedOption == option ? "largecircle.fill.circle" : "circle")
                        .onTapGesture {
                            self.selectedOption = option
                        }
                }
                .padding()
            }
        }
    }
}
