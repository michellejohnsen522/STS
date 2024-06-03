//
//  User.swift
//  STS
//
//  Created by admin on 6/3/24.
//



import Foundation
import RealmSwift

class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var name: String = ""
    @Persisted var surname: String = ""
    
    @Persisted var email: String = ""
    @Persisted var birthday: String = ""
    @Persisted var phone: String = ""
    
    @Persisted var code: String = ""
    @Persisted var level: String = "1 level"
    @Persisted var credits: Int = 0

}
