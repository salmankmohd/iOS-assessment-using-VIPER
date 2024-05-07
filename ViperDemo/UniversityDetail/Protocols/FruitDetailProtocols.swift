//
//  UniversityDetailPresenterProtocol.swift
//  ViperDemo
//
//  Created by salmanul faris on 07/05/24.
//  Copyright © 2024. All rights reserved.
//

import UIKit

protocol UniversityDetailPresenterProtocol: class {
    
    var wireframe: UniversityDetailWireFrameProtocol? {get set}
    var view: UniversityDetailViewProtocol? {get set}
    
    //View -> Presenter
    func viewDidLoad()
    func backButtonPressed(from view: UIViewController)
    
}

protocol UniversityDetailViewProtocol: class {
    //Presenter -> View
    func showUniversityDetail(with university: UniversityObject)
}

protocol UniversityDetailWireFrameProtocol: class {
    func goBackToUniversityListView(from view: UIViewController)
}
