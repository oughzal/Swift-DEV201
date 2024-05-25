import SwiftUI

struct TimeDifferenceCalculatorView: View {
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var result = ""

    var body: some View {
        NavigationView {
            Form {
                DatePicker("Date de début", selection: $startDate, displayedComponents: .date)
                DatePicker("Date de fin", selection: $endDate, in: startDate...)
                Button("Calculer la différence") {
                    calculateTimeDifference()
                }
                Text(result)
            }
            .navigationTitle("Calculateur de Temps")
        }
    }
    
    func calculateTimeDifference() {
        let calendar = Calendar.current
        let diff = calendar.dateComponents([.day, .hour, .minute], from: startDate, to: endDate)
        if let day = diff.day, let hour = diff.hour, let minute = diff.minute {
            result = "Différence: \(day) jours, \(hour) heures, \(minute) minutes"
        } else {
            result = "Erreur dans le calcul du temps"
        }
    }
}

@main
struct TimeDiffApp: App {
    var body: some Scene {
        WindowGroup {
            TimeDifferenceCalculatorView()
        }
    }
}
