//
//  MovieDataStore.swift
//  Movies
//
//  Created by Dirk Hostens on 04/12/2023.
//

import Foundation

@Observable
class MovieDataStore {
    private var movies = [Movie]()

    init() { }

    func getMovies() -> [Movie] {
        return movies
    }

    func getMovies(actor: Actor) -> [Movie] {
        return movies.filter { $0.actors.contains(actor) }
    }

    func getMovies(director: Director) -> [Movie] {
        return movies.filter { $0.director == director }
    }

    func getActors(director: Director) -> [Actor] {
        let films = getMovies(director: director)
        let allActors = films.flatMap { $0.actors }
        return Array(Set(allActors))
    }

    private func sort() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        movies.sort {
            guard let d1 = formatter.date(from: $0.releaseDate),
                  let d2 = formatter.date(from: $1.releaseDate) else {
                return $0.releaseDate < $1.releaseDate
            }
            return d1 < d2
        }
    }

    func loadData() async {
        //simulate async call
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2))

            let data: Movies = load("movies.json")
            movies = data.movies

            sort()
            print("✅ Data loaded successfully.")

        } catch {
            print("❌ Failed to load movies:", error)
            movies = [Movie]()
        }
    }
}
