import SwiftUI

// Modèle de données pour une recette
struct Recipe: Identifiable {
    var id = UUID()
    var title: String
    var ingredients: [String]
    var steps: [String]
    var imageName: String
}

// Vue principale de l'application
struct ContentView: View {
    @State private var recipes: [Recipe] = [
        Recipe(title: "Spaghetti Carbonara", ingredients: ["Spaghetti", "Bacon", "Crème fraîche", "Jaunes d'oeufs", "Parmesan"], steps: ["Cuire les pâtes", "Faire revenir le bacon", "Mélanger les jaunes et la crème", "Ajouter les pâtes et mélanger sur feu doux", "Servir avec du parmesan"], imageName: "carbonara"),
        Recipe(title: "Salade César", ingredients: ["Laitue romaine", "Croûtons", "Parmesan", "Poulet grillé", "Sauce César"], steps: ["Préparer la laitue", "Ajouter les croûtons et le poulet", "Saupoudrer de parmesan", "Ajouter la sauce"], imageName: "cesar")
    ]
    
    var body: some View {
        NavigationView {
            List(recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    RecipeRow(recipe: recipe)
                }
            }
            .navigationTitle("Mon Livre de Recettes")
            .toolbar {
                Button("Ajouter Recette") {
                    // Logique pour ajouter une recette
                }
            }
        }
    }
}

// Vue pour afficher le détail d'une recette
struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Ingrédients")
                    .font(.headline)
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("- " + ingredient)
                }
                
                Text("Étapes")
                    .font(.headline)
                ForEach(recipe.steps, id: \.self) { step in
                    Text(step)
                }
            }
            .padding()
        }
        .navigationTitle(recipe.title)
    }
}

// Vue pour une ligne de recette dans la liste
struct RecipeRow: View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            Image(recipe.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(recipe.title)
                    .font(.headline)
                Text(recipe.ingredients.joined(separator: ", "))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

@main
struct RecipeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
