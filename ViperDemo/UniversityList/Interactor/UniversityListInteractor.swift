//
//  UniversityListInteractor.swift
//  ViperDemo
//
//  Created by salmanul faris on 07/05/24.
//  Copyright © 2024. All rights reserved.
//


import UIKit
import RealmSwift
import Reachability

class UniversityListInteractor: UniversityListInputInteractorProtocol {
    
    var presenter: UniversityListOutputInteractorProtocol?
    
    func getAllUniversityDetail() {
        if checkInternetConnection() {
            NetworkManager.shared.fetchData(completion: { result in
                switch result {
                case .success(let universities):
                    
                    let realm = try! Realm()
                    try! realm.write {
                        realm.deleteAll() // Clear existing data
                        for university in universities {
                            let data  = UniversityObject()
                            data.country = university.country
                            data.name = university.name
                            data.alpha_two_code = university.alpha_two_code
                            realm.add(data)
                        }
                    }
                    self.presenter?.universityListDidFetch(univertisities: universities)
                case .failure(let error):
                    print(error)
                    self.getLocalData()
                    break
                }
            })
        }else{
            self.getLocalData()
        }
    }
    func getLocalData(){
        // Fetch universities from Realm
        print("Fetch universities from Realm")
        do {
            let realm = try Realm()
            let universities = Array(realm.objects(UniversityObject.self))
            self.presenter?.universityListDidFetch(univertisities: universities)
            
        } catch {
            print(error)
            
        }
        
    }
}
func checkInternetConnection() -> Bool {
    let reachability = try! Reachability()
    
    switch reachability.connection {
    case .wifi, .cellular:
        return true
    case .unavailable, .none:
        return false
    }
}
