//  Liste Basique
import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Élément 1")
            Text("Élément 2")
            Text("Élément 3")
        }
    }
}

// liste avec des données Dynamiques
import SwiftUI

struct ContentView: View {
    let items = ["Pomme", "Banane", "Orange"]

    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
        }
    }
}

//Liste avec Section
import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Section(header: Text("Fruits")) {
                Text("Pomme")
                Text("Banane")
            }
            Section(header: Text("Légumes")) {
                Text("Carotte")
                Text("Brocoli")
            }
        }
    }
}

// Liste avec Navigation
import SwiftUI

struct ContentView: View {
    let items = ["Pomme", "Banane", "Orange"]

    var body: some View {
        NavigationView {
            List(items, id: \.self) { item in
                NavigationLink(destination: Text("Vous avez sélectionné \(item)")) {
                    Text(item)
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

//Liste Personnalisée avec Cellules
import SwiftUI

struct ContentView: View {
    let items = [("Pomme", "Rouge"), ("Banane", "Jaune"), ("Orange", "Orange")]

    var body: some View {
        List(items, id: \.0) { item in
            HStack {
                Circle()
                    .fill(Color(item.1))
                    .frame(width: 20, height: 20)
                Text(item.0)
            }
        }
    }
}

