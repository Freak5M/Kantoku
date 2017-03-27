//
//  DashboardController.swift
//  Kantoku
//
//  Created by Apple on 27/03/2017.
//
//

import PerfectLib
import PerfectHTTP
import Foundation


final class DashboardController {
    
    static func index(request : HTTPRequest, response: HTTPResponse) {
        
        let res = ResultArray(status: .ok, data: [User(), User()])
        
        try! response.setBody(json: res.getJSONValues())
        response.addHeader(.contentType, value: "application/json")
        response.completed()
    }
    
}
