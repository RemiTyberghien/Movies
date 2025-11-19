import SwiftUI

struct ActorDetailView: View {
    let actor: Actor
    @Environment(MovieDataStore.self) private var movieDataStore

    var body: some View {
        List(movieDataStore.getMovies(actor: actor)) { movie in
            NavigationLink(value: Route.movie(movie)) {
                Text(movie.title)
            }
        }
        .navigationTitle(actor.firstName + " " + actor.lastName)
    }
}
