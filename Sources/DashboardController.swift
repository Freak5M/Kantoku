//
//  DashboardController.swift
//  Kantoku
//
//  Created by Apple on 27/03/2017.
//
//

import PerfectHTTP
import Foundation

final class DashboardController {
    
    static func index(request : HTTPRequest, response: HTTPResponse) {
        let user = User()
        
        try! response.setBody(json: user.getJSONValues())
        response.addHeader(.contentType, value: "application/json")
        response.completed()
    }
    
}
