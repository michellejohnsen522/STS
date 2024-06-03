//
//  Reservation.swift
//  STS
//
//  Created by admin on 6/3/24.
//







import Foundation
import RealmSwift

class Reservation: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var date = ""
    @Persisted var time = ""
    @Persisted var selectedHour = ""
    @Persisted var players = ""
    @Persisted var additionInfo = ""
    @Persisted var name = ""
    @Persisted var number = ""
    @Persisted var email = ""
    @Persisted var club = ""

}
