//
//  PathStore.swift
//  Movies
//
//  Created by Remi.Tyberghien on 02/12/2025.
//

import Foundation
@Observable
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
