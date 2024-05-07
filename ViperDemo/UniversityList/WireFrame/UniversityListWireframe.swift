//
//  UniversityListWireframe.swift
//  ViperDemo
//
//  Created by salmanul faris on 07/05/24.
//  Copyright © 2024. All rights reserved.
//

import UIKit

class UniversityListWireframe: UniversityListWireFrameProtocol {
   
    func pushToUniversityDetail(with university: UniversityObject,from view: UIViewController) {
        let universityDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "UniversityDetailView") as! UniversityDetailView
        UniversityDetailWireFrame.createuniversityDetailModule(with: universityDetailViewController, and: university)
        view.navigationController?.pushViewController(universityDetailViewController, animated: true)
    }
    
    class func createUniversityListModule(universityListRef: UniversityListView) {
       let presenter: UniversityListPresenterProtocol & UniversityListOutputInteractorProtocol = UniversityListPresenter()
        
        universityListRef.presenter = presenter
        universityListRef.presenter?.wireframe = UniversityListWireframe()
        universityListRef.presenter?.view = universityListRef
        universityListRef.presenter?.interactor = UniversityListInteractor()
        universityListRef.presenter?.interactor?.presenter = presenter
    }
    
}
