//
//  RealmManager.swift
//  ViperArch
//
//  Created by salmanul faris on 07/05/24.
//  Copyright © 2024. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmManagerProtocol {
    func saveUniversities(_ universities: [UniversityObject])
    func getUniversities() -> Results<UniversityObject>?
}

class RealmManager: RealmManagerProtocol {
    func saveUniversities(_ universities: [UniversityObject]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(universities, update: .modified)
            }
        } catch {
            print("Error saving universities to Realm: \(error)")
        }
    }
    
    func getUniversities() -> Results<UniversityObject>? {
        do {
            let realm = try Realm()
            return realm.objects(UniversityObject.self)
        } catch {
            print("Error fetching universities from Realm: \(error)")
            return nil
        }
    }
}
