//
//  User.swift
//  Kantoku
//
//  Created by Apple on 27/03/2017.
//
//

import PerfectLib
import PerfectHTTP
import Foundation

extension Date : JSONConvertible {
    
    public func jsonEncodedString() throws -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter.string(from: self)
    }
    
}



class User : JSONConvertibleObject {
    
    static let jsonRegisterName = "user"
    
    var id : String = UUID().string
    var firstName : String = ""
    var lastName : String = ""
    var email : String = ""
    var password : String = ""
    var createdAt : Date = Date()
    var modifiedAt : Date = Date()
    
    override func setJSONValues(_ values: [String : Any]) {
        self.id = getJSONValue(named: "id", from: values, defaultValue: "")
        self.firstName = getJSONValue(named: "firstName", from: values, defaultValue: "")
        self.lastName = getJSONValue(named: "lastName", from: values, defaultValue: "")
        self.email = getJSONValue(named: "email", from: values, defaultValue: "")
        self.password = getJSONValue(named: "password", from: values, defaultValue: "")
        self.createdAt = getJSONValue(named: "createdAt", from: values, defaultValue: Date())
        self.modifiedAt = getJSONValue(named: "modifiedAt", from: values, defaultValue: Date())
    }
    
    override func getJSONValues() -> [String : Any] {
        return [
            JSONDecoding.objectIdentifierKey:User.jsonRegisterName,
            "id": id,
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "password" : password,
            "createdAt" : try! createdAt.jsonEncodedString(),
            "modifiedAt": try! modifiedAt.jsonEncodedString()
        ]
    }
    
}
