import SwiftUI

// Modèle pour les tâches
struct Task: Identifiable {
    var id = UUID()
    var description: String
    var isCompleted: Bool = false
}

// Vue principale de l'application
struct ContentView: View {
    @State private var tasks = [
        Task(description: "Apprendre SwiftUI", isCompleted: false),
        Task(description: "Faire les courses", isCompleted: false),
        Task(description: "Appeler John", isCompleted: false)
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach($tasks) { $task in
                    TaskRow(task: $task)
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("Gestionnaire de Tâches")
            .toolbar {
                EditButton()
            }
        }
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

// Vue pour une ligne de tâche dans la liste
struct TaskRow: View {
    @Binding var task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .gray)
                .onTapGesture {
                    task.isCompleted.toggle()  // Basculer le statut de complétion de la tâche
                }
            Text(task.description)
                .strikethrough(task.isCompleted, color: .gray)
                .foregroundColor(task.isCompleted ? .gray : .black)
        }
    }
}

@main
struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
