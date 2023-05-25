//
//  DatabaseManager.swift
//  Firechat
//
//  Created by Daniyal Ganiuly on 27.02.2023.
//

import Foundation
import FirebaseDatabase


final class DatabaseManager {
    static let shared = DatabaseManager()
    
    
    private let database = Database.database().reference()
    
    
}




struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
    
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
}


extension DatabaseManager {
    public func insertUser(with user: ChatAppUser) {
        print(user.safeEmail)
        database.child(user.safeEmail).setValue([
            "Имя": user.firstName,
            "Фамилия": user.lastName
        ])
    }
    
    public func userExists(with email: String, completion: @escaping ((Bool) -> Void)) {
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        database.child(safeEmail).observeSingleEvent(
            of: .value,
            with: { snapshot in
                guard snapshot.value as? String != nil else{
                    completion(false)
                    return
                }
                completion(true)
        })
    }
}
