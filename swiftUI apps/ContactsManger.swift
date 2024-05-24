import SwiftUI

// Modèle de données pour un contact
struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var phoneNumber: String
}

// Vue principale de l'application
struct ContentView: View {
    @State private var contacts: [Contact] = []
    @State private var showingAddContact = false

    var body: some View {
        NavigationView {
            List {
                ForEach(contacts) { contact in
                    VStack(alignment: .leading) {
                        Text(contact.name)
                            .font(.headline)
                        Text(contact.email)
                            .font(.subheadline)
                        Text(contact.phoneNumber)
                            .font(.subheadline)
                    }
                }
                .onDelete(perform: deleteContact)
            }
            .navigationTitle("Carnet d'adresses")
            .toolbar {
                Button("Ajouter") {
                    showingAddContact = true
                }
            }
            .sheet(isPresented: $showingAddContact) {
                AddContactView(contacts: $contacts)
            }
        }
    }

    func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
}

// Vue pour ajouter un nouveau contact
struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var contacts: [Contact]
    @State private var name = ""
    @State private var email = ""
    @State private var phoneNumber = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Nom", text: $name)
                TextField("Email", text: $email)
                TextField("Numéro de téléphone", text: $phoneNumber)
                Button("Ajouter") {
                    let newContact = Contact(name: name, email: email, phoneNumber: phoneNumber)
                    contacts.append(newContact)
                    dismiss()
                }
            }
            .navigationTitle("Nouveau Contact")
            .toolbar {
                Button("Annuler") {
                    dismiss()
                }
            }
        }
    }
}

@main
struct ContactsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
