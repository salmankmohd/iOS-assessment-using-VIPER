//
//  UniversityObject.swift
//  ViperDemo
//
//  Created by salmanul faris on 07/05/24.
//  Copyright © 2024. All rights reserved.
//

import Foundation
import RealmSwift

class UniversityObject: Object, Decodable {
    @objc dynamic var name: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var alpha_two_code: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name
        case country
        case alpha_two_code
    }
}
