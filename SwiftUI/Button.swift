import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Cliquez ici", action: buttonClicked)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
    
    // Définition de la méthode qui gère l'action du bouton
    func buttonClicked() {
        print("Le bouton a été cliqué!")
        // Ajoutez plus de logique ici selon les besoins
    }
}
