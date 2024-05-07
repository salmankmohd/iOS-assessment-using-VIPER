//
//  UniversityDetailWireFrame.swift
//  ViperDemo
//
//  Created by salmanul faris on 07/05/24.
//  Copyright © 2024. All rights reserved.
//

import UIKit

class UniversityDetailWireFrame: UniversityDetailWireFrameProtocol {
    
    class func createuniversityDetailModule(with universityDetailRef: UniversityDetailView, and university: UniversityObject) {
        let presenter = UniversityDetailPresenter()
        presenter.university = university
        universityDetailRef.presenter = presenter
        universityDetailRef.presenter?.view = universityDetailRef
        universityDetailRef.presenter?.wireframe = UniversityDetailWireFrame()
    }
    
    func goBackToUniversityListView(from view: UIViewController) {
        guard let sourceView = view as? UIViewController else {
            return
        }
        sourceView.navigationController?.popViewController(animated: true)

    }
    
    deinit {
        print("UniversityDetailWireFrame removed")
    }

}
