//
//  Router.swift
//  Kantoku
//
//  Created by Apple on 27/03/2017.
//
//

import PerfectHTTP
import PerfectRequestLogger
import Foundation

struct AuthFilter : HTTPRequestFilter {
    
    func filter(request: HTTPRequest, response: HTTPResponse, callback: (HTTPRequestFilterResult) -> ()) {
        print("filter")
        callback(.continue(request, response))
    }
    
}


final class Router {
    
    static func getFilters() -> [(HTTPRequestFilter, HTTPFilterPriority)] {
        return [
            (RequestLogger(), HTTPFilterPriority.high),
            (AuthFilter(), HTTPFilterPriority.medium)
        ]
    }
    
    static func getRoutes() -> [Route] {
        return [
            Route(method: .get, uri: "/users/list", handler: UserController.list),
            Route(method: .get, uri: "/users/details", handler: UserController.details)
        ]
    }
    
}
