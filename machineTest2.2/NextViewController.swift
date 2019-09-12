//
//  NextViewController.swift
//  machineTest2.2
//
//  Created by rpsindia on 12/09/19.
//  Copyright © 2019 Apurva. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UITableViewDataSource {
    
    var selectedBooks = [Book]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return selectedBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let model = selectedBooks[indexPath.row]
        cell.textLabel?.text = String(model.price)
        return cell
        
        
    }
    

    
    
    @IBOutlet var nextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       print(selectedBooks)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func totalCostButton(_ sender: UIButton) {
        var totalCost = 0
        for i in 0..<selectedBooks.count {
          let model = selectedBooks[i]
            totalCost += model.price
            nextLabel.text = String(totalCost)
        }
   
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
