import SwiftUI

enum Route: Hashable {
    case movie(Movie)
    case director(Director)
    case actor(Actor)

}


@Observable
class PathStore
{
    var path = [Route]()
}


struct ContentView: View {

    @Environment(MovieDataStore.self) var movieDataStore
    @State private var pathStore = PathStore()

    var body: some View {
        NavigationStack(path: $pathStore) {

            List(movieDataStore.getMovies(), id: \.self ) { movie in
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
