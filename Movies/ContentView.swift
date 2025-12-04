import SwiftUI





struct ContentView: View {

    @Environment(MovieDataStore.self) var movieDataStore
    @State var route = [Route]()

    var body: some View {
        NavigationStack(path: $route) {

            
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
