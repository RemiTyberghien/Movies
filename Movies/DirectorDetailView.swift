import SwiftUI

struct DirectorDetailView: View {
    let director: Director
    @Environment(MovieDataStore.self) private var movieDataStore

    var body: some View {
        
        Section("Movies")
        {
            List(movieDataStore.getMovies(director: director), id: \.self) { movie in
                NavigationLink(value: Route.movie(movie)) {
                    Text(movie.title)
                }
            }
        }
        
        Section("Actors"){
            List(movieDataStore.getActors(director: director), id: \.self) { actor in
                NavigationLink(value: Route.actor(actor)) {
                    Text(actor.firstName + " " + actor.lastName)
                }
            }
        }
        
        .navigationTitle(director.firstName + " " + director.lastName)
    }
}
