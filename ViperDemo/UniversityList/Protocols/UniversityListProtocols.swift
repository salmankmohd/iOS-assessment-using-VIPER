//
//  UniversityListViewProtocol.swift
//  ViperDemo
//
//  Created by salmanul faris on 07/05/24.
//  Copyright © 2024. All rights reserved.
//

import UIKit


protocol UniversityListViewProtocol {
    // PRESENTER -> VIEW
    func showUniversitys(with univertisities: [UniversityObject])
}

protocol UniversityListPresenterProtocol {
    //View -> Presenter
    var interactor: UniversityListInputInteractorProtocol? {get set}
    var view: UniversityListViewProtocol? {get set}
    var wireframe: UniversityListWireFrameProtocol? {get set}

    func viewDidLoad()
    func showUniversitySelection(with university: UniversityObject, from view: UIViewController)
}

protocol UniversityListInputInteractorProtocol {
    var presenter: UniversityListOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func getAllUniversityDetail()
}

protocol UniversityListOutputInteractorProtocol {
    //Interactor -> Presenter
    func universityListDidFetch(univertisities: [UniversityObject])
}

protocol UniversityListWireFrameProtocol {
    //Presenter -> Wireframe
    func pushToUniversityDetail(with university: UniversityObject,from view: UIViewController)
    static func createUniversityListModule(universityListRef: UniversityListView)
}
