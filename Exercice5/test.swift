import Foundation
let now = Date()
let calendar = Calendar.current
let date2 = calendar.date(byAdding : .day, value:120, to:now) ?? Date()
print(now)
print(date2)