//
//  UniversityDetailPresenter.swift
//  ViperDemo
//
//  Created by salmanul faris on 07/05/24.
//  Copyright © 2024. All rights reserved.
//

import UIKit

class UniversityDetailPresenter: UniversityDetailPresenterProtocol {
    
    weak var view: UniversityDetailViewProtocol?
    var wireframe: UniversityDetailWireFrameProtocol?
    var university: UniversityObject?
    
    func viewDidLoad() {
        view?.showUniversityDetail(with: university!)
    }
    
    func backButtonPressed(from view: UIViewController) {
        
    }
    
    deinit {
        print("UniversityDetailPresenter removed")
    }
    
}
