//
//  Results.swift
//  Kantoku
//
//  Created by Apple on 27/03/2017.
//
//

import PerfectLib
import PerfectHTTP
import Foundation

class BaseResult : JSONConvertibleObject {
    
    var status : Int = 200
    var message : String? = nil
    
    init(status: HTTPResponseStatus, message: String? = nil) {
        self.status = status.code
        self.message = message
    }
    
    override func setJSONValues(_ values: [String : Any]) {
        self.status = getJSONValue(named: "status", from: values, defaultValue: 500)
        self.message = getJSONValue(named: "message", from: values, defaultValue: "")
    }
    
    override func getJSONValues() -> [String : Any] {
        var res : [String: Any] = [:]
        res["status"] = self.status
        if let m = self.message {
            res["message"] = m
        }
        return res
    }
}


class Result : BaseResult {
    
    var data : JSONConvertibleObject? = nil
    
    init(status: HTTPResponseStatus, message: String? = nil, data: JSONConvertibleObject? = nil) {
        super.init(status: status, message: message)
        self.data = data
    }
    
    override func setJSONValues(_ values: [String : Any]) {
        super.setJSONValues(values)
    }
    
    override func getJSONValues() -> [String : Any] {
        var res = super.getJSONValues()
        if let d = self.data {
            res["data"] = d.getJSONValues()
        }
        return res
    }
}


class ResultArray : BaseResult {
    
    var data : [JSONConvertibleObject] = []
    
    override func setJSONValues(_ values: [String : Any]) {
        super.setJSONValues(values)
    }
    
    init(status: HTTPResponseStatus, message: String? = nil, data: [JSONConvertibleObject] = []) {
        super.init(status: status, message: message)
        self.data = data
    }
    
    override func getJSONValues() -> [String : Any] {
        var res = super.getJSONValues()
        res["data"] = self.data.map({ $0.getJSONValues() })
        return res
    }    
}
