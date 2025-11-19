import SwiftUI

struct DirectorDetailView: View {
    let director: Director
    @Environment(MovieDataStore.self) private var movieDataStore

    var body: some View {
        List(movieDataStore.getActors(director: director)) { actor in
            NavigationLink(value: Route.actor(actor)) {
                Text(actor.firstName + " " + actor.lastName)
            }
        }
        .navigationTitle(director.firstName + " " + director.lastName)
    }
}
