//
//  ViewController.swift
//  customTableViwCell
//
//  Created by Dace Laizane on 14/11/2019.
//  Copyright © 2019 Kate Klavina. All rights reserved.
//

import UIKit

struct Car{
    
    let model: String
    let make: String
}

class ViewController: UIViewController {

    var datasource: [Car] = []
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.dataSource = self
        
        tblView.dataSource = self
        
        loadDataSource()
        
    }

    func loadDataSource() {
        
        datasource.append(Car(model: "Tesla", make: "Model S"))
        datasource.append(Car(model: "Tesla", make: "Model X"))
        datasource.append(Car(model: "Tesla", make: "Model 3"))
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        guard let carCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CarTableViewCell else {
            return UITableViewCell()
        }
        
        let car = datasource[indexPath.row]
        
        carCell.makeLabel.text = "This is \(car.make)"
        carCell.modelLabel.text = "The best \(car.model) ever"
        
        
        return carCell
    }
    
}

