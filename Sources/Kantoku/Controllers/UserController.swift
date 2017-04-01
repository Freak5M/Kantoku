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
import PerfectLogger
// import MySQL

final class UserController {
    
    static let logPrefix = "UserController -"
    
    static func add(request : HTTPRequest, response: HTTPResponse) {
        
        // let dataMysql = MySQL()
        
    }
    
    static func list(request : HTTPRequest, response: HTTPResponse) {
        LogFile.info("\(logPrefix) list")
        var res : BaseResult = ResultArray(status: .ok, data: [User(), User()])
        
        do {
            response.status = .ok
            try response.setBody(json: res.getJSONValues())
        } catch {
            res = BaseResult(status: .badRequest, message: "Error while serializing")
            response.status = .badRequest
            try! response.setBody(json: res.getJSONValues())
        }
        
        response.addHeader(.contentType, value: "application/json")
        response.completed()
    }
    
    
    static func details(request : HTTPRequest, response: HTTPResponse) {
        var res : BaseResult = Result(status: .ok, data: User())
        
        do {
            response.status = .ok
            try response.setBody(json: res.getJSONValues())
        } catch {
            res = BaseResult(status: .badRequest, message: "Error while serializing")
            response.status = .badRequest
            try! response.setBody(json: res.getJSONValues())
        }
        
        response.addHeader(.contentType, value: "application/json")
        response.completed()
    }
    
}
