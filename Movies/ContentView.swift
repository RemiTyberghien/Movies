import SwiftUI

struct ContentView: View {

    @Environment(MovieDataStore.self) private var movieDataStore
    @State private var navigationPath: [Route] = []

    var body: some View {
        NavigationStack(path: $navigationPath) {

            List(movieDataStore.getMovies()) { movie in
                NavigationLink(value: Route.movie(movie)) {
                    Text(movie.title)
                }
            }
            .navigationTitle("Movies")
            .navigationDestination(for: Route.self) { route in
                switch route {

                case let .actor(actor):
                    ActorDetailView(actor: actor)

                case let .director(director):
                    DirectorDetailView(director: director)

                case let .movie(movie):
                    MovieDetailView(movie: movie)
                }
            }
        }
    }
}
