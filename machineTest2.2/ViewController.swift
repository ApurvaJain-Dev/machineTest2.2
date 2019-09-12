//
//  ViewController.swift
//  machineTest2.2
//
//  Created by rpsindia on 12/09/19.
//  Copyright © 2019 Apurva. All rights reserved.
//

import UIKit
  struct Book {
  var  name: String
  var  price: Int
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var emptyArray = [Book]()
    
    var books = [Book(name: "Maths", price: 150), Book(name: "English", price: 120), Book(name: "Science", price: 200), Book(name: "Social Science", price: 233), Book(name: "Sanskrit", price: 100)]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return books.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let model = books[indexPath.row]
        cell.textLabel?.text = model.name
        cell.detailTextLabel?.text = String(model.price)
        return cell
        
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark
        {
            cell?.accessoryType = .none
            
            let model = books[indexPath.row]
            for i in 0..<emptyArray.count {
                let emptyModel = emptyArray[i]
                if emptyModel.name == model.name {
                    emptyArray.remove(at: i)
                    break
                }
            }
            print(books)
        }
        else {
            cell?.accessoryType = .checkmark
            let model = books[indexPath.row]
            emptyArray.append(model)
            print(books)
        }
        
    }

    @IBAction func doneButton(_ sender: UIButton) {
        
        print(emptyArray)
        
       
        let next = storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        
        navigationController?.pushViewController(next, animated: true)
        
        next.selectedBooks = emptyArray
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

