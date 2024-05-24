import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("nomDeVotreImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .clipped()
            .cornerRadius(50)
    }
}
