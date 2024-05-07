//
//  UniversityDetailView.swift
//  ViperDemo
//
//  Created by salmanul faris on 07/05/24.
//  Copyright © 2024. All rights reserved.
//

import UIKit

class UniversityDetailView: UIViewController,UniversityDetailViewProtocol {
    

    @IBOutlet var NameLbl: UILabel!
    @IBOutlet var countryLbl: UILabel!
    @IBOutlet var codeLbl: UILabel!
    
    var presenter: UniversityDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnBack(){
        self.navigationController?.popViewController(animated: true)
    }

    func showUniversityDetail(with university: UniversityObject) {
        NameLbl.text = "Title: " + university.name
        countryLbl.text = "country: " + university.country
        codeLbl.text = "code: " + university.alpha_two_code
    }
    
    deinit {
        print("UniversityDetailView removed")
    }

}
