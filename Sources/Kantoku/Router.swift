//
//  Router.swift
//  Kantoku
//
//  Created by Apple on 27/03/2017.
//
//

import PerfectHTTP
import Foundation

final class Router {
    
    static func getRoutes() -> [Route] {
        return [
            Route(method: .get, uri: "/users/list", handler: UserController.list),
            Route(method: .get, uri: "/users/details", handler: UserController.details)
        ]
    }
    
}
