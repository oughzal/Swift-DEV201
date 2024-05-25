import SwiftUI

// Modèle pour les rappels
struct Reminder: Identifiable {
    var id = UUID()
    var title: String
    var dueDate: Date
}

// Vue principale de l'application
struct ContentView: View {
    @State private var reminders: [Reminder] = []
    @State private var newReminderTitle: String = ""
    @State private var newReminderDate = Date()

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Ajouter un nouveau rappel")) {
                    TextField("Titre du rappel", text: $newReminderTitle)
                    DatePicker("Date", selection: $newReminderDate, displayedComponents: .date)
                    Button("Ajouter") {
                        addReminder()
                    }
                }
                
                Section(header: Text("Vos Rappels")) {
                    ForEach(reminders) { reminder in
                        VStack(alignment: .leading) {
                            Text(reminder.title).font(.headline)
                            Text("Due: \(reminder.dueDate, formatter: itemFormatter)")
                        }
                    }
                    .onDelete(perform: deleteReminder)
                }
            }
            .navigationTitle("Gestionnaire de Rappels")
        }
    }

    func addReminder() {
        let newReminder = Reminder(title: newReminderTitle, dueDate: newReminderDate)
        reminders.append(newReminder)
        newReminderTitle = ""
        newReminderDate = Date()
    }

    func deleteReminder(at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets)
    }
}

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    return formatter
}()

@main
struct ReminderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
