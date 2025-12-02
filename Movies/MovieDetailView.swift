import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @Environment(MovieDataStore.self) private var movieDataStore

    var body: some View {
        List {

            
            Section("Movie") {
                Text(movie.title)
                    .font(.title2)
                    .bold()

                Text("Release date: \(movie.releaseDate)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

          
            Section("Director") {
                NavigationLink(value: Route.director(movie.director)) {
                    Text(movie.director.firstName + " " + movie.director.lastName)
                }
            }


            Section("Actors") {
                ForEach(movie.actors) { actor in
                    NavigationLink(value: Route.actor(actor)) {
                        Text(actor.firstName + " " + actor.lastName)
                    }
                }
            }
        }
        .navigationTitle(movie.title)
    }
}
