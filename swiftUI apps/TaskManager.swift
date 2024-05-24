import SwiftUI

// Modèles
struct Task: Identifiable {
    let id = UUID()
    var description: String
    var isCompleted: Bool = false
}

struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var phoneNumber: String
}

// Vue principale
struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var newTaskDescription: String = ""
    
    @State private var contacts: [Contact] = []
    @State private var newName: String = ""
    @State private var newEmail: String = ""
    @State private var newPhoneNumber: String = ""

    var body: some View {
        NavigationView {
            List {
                // Section pour les tâches
                Section(header: Text("Ajouter une nouvelle tâche")) {
                    HStack {
                        TextField("Nouvelle tâche", text: $newTaskDescription)
                        Button(action: addTask) {
                            Label("Ajouter", systemImage: "plus.circle.fill")
                        }
                    }
                }
                ForEach(tasks) { task in
                    Text(task.description)
                }
                .onDelete(perform: deleteTask)

                // Section pour les contacts
                Section(header: Text("Ajouter un nouveau contact")) {
                    VStack {
                        TextField("Nom", text: $newName)
                        TextField("Email", text: $newEmail)
                        TextField("Téléphone", text: $newPhoneNumber)
                        Button("Ajouter Contact", action: addContact)
                    }
                }
                ForEach(contacts) { contact in
                    VStack(alignment: .leading) {
                        Text(contact.name).font(.headline)
                        Text(contact.email).font(.subheadline)
                        Text(contact.phoneNumber).font(.subheadline)
                    }
                }
                .onDelete(perform: deleteContact)
            }
            .navigationTitle("Gestionnaire Multifonctions")
        }
    }

    func addTask() {
        let newTask = Task(description: newTaskDescription)
        tasks.append(newTask)
        newTaskDescription = ""
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

    func addContact() {
        let newContact = Contact(name: newName, email: newEmail, phoneNumber: newPhoneNumber)
        contacts.append(newContact)
        newName = ""
        newEmail = ""
        newPhoneNumber = ""
    }

    func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
}

@main
struct CombinedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
