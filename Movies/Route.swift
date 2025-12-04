//
//  Route.swift
//  Movies
//
//  Created by Remi.Tyberghien on 04/12/2025.
//

import Foundation


enum Route: Hashable {
    case movie(Movie)
    case director(Director)
    case actor(Actor)

}
