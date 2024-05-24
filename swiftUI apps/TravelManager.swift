import SwiftUI

// Modèle pour les destinations
struct Destination: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var travelDates: String
}

// Vue principale de l'application avec TabView
struct ContentView: View {
    @State private var destinations: [Destination] = []

    var body: some View {
        TabView {
            DestinationsListView(destinations: $destinations)
                .tabItem {
                    Label("Destinations", systemImage: "list.bullet")
                }
            
            AddDestinationView(destinations: $destinations)
                .tabItem {
                    Label("Ajouter", systemImage: "plus.circle")
                }
        }
    }
}

// Vue pour afficher la liste des destinations
struct DestinationsListView: View {
    @Binding var destinations: [Destination]

    var body: some View {
        NavigationView {
            List {
                ForEach(destinations) { destination in
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        Text(destination.description)
                            .font(.subheadline)
                        Text("Dates de voyage: \(destination.travelDates)")
                            .font(.subheadline)
                    }
                }
                .onDelete(perform: deleteDestination)
            }
            .navigationTitle("Vos Destinations")
            .toolbar {
                EditButton()
            }
        }
    }

    func deleteDestination(at offsets: IndexSet) {
        destinations.remove(atOffsets: offsets)
    }
}

// Vue pour ajouter une nouvelle destination
struct AddDestinationView: View {
    @Binding var destinations: [Destination]
    @State private var name = ""
    @State private var description = ""
    @State private var travelDates = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Nom de la destination", text: $name)
                TextField("Description", text: $description)
                TextField("Dates de voyage", text: $travelDates)
                Button("Ajouter Destination") {
                    let newDestination = Destination(name: name, description: description, travelDates: travelDates)
                    destinations.append(newDestination)
                    // Reset fields after addition
                    name = ""
                    description = ""
                    travelDates = ""
                }
                .disabled(name.isEmpty || description.isEmpty || travelDates.isEmpty)
            }
            .navigationTitle("Ajouter une Destination")
        }
    }
}

@main
struct TravelPlannerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
