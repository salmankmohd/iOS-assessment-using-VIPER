//
//  UniversityListView.swift
//  ViperDemo
//
//  Created by salmanul faris on 07/05/24.
//  Copyright © 2024. All rights reserved.
//

import UIKit

class UniversityListView: UIViewController,UniversityListViewProtocol {
    
    @IBOutlet weak var btnReload: UIButton!
    @IBOutlet var universityTblView: UITableView!
    
    var presenter:UniversityListPresenterProtocol?
    var univertisities = [UniversityObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnReload.titleLabel?.isHidden = true
        UniversityListWireframe.createUniversityListModule(universityListRef: self)
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reloadData(){
        presenter?.viewDidLoad()

    }
    
    func showUniversitys(with univertisities: [UniversityObject]) {
        self.univertisities = univertisities
        DispatchQueue.main.async {
            self.universityTblView.reloadData()
        }
    }

}

extension UniversityListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityCell", for: indexPath) as! UniversityCell
        let univertisity = univertisities[indexPath.row]
        cell.lblName?.text = univertisity.name
        cell.lblCode?.text = univertisity.country
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return univertisities.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showUniversitySelection(with: univertisities[indexPath.row], from: self)
    }
    
}
class UniversityCell : UITableViewCell{
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblCode: UILabel!

}

