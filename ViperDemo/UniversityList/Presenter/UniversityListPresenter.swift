//
//  UniversityListPresenter.swift
//  ViperDemo
//
//  Created by salmanul faris on 07/05/24.
//  Copyright © 2024. All rights reserved.
//

import UIKit
import RealmSwift

class UniversityListPresenter: UniversityListPresenterProtocol {
    
    var wireframe: UniversityListWireFrameProtocol?
    var view: UniversityListViewProtocol?
    var interactor: UniversityListInputInteractorProtocol?

    func showUniversitySelection(with university: UniversityObject, from view: UIViewController) {
        wireframe?.pushToUniversityDetail(with: university, from: view)
    }
    
    func viewDidLoad() {
        interactor?.getAllUniversityDetail()
    }
}

extension UniversityListPresenter: UniversityListOutputInteractorProtocol {
    
    func universityListDidFetch(univertisities: [UniversityObject]) {
        view?.showUniversitys(with: univertisities)
    }
    
}
