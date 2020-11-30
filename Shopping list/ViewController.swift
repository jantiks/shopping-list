//
//  ViewController.swift
//  Shopping list
//
//  Created by Tigran on 11/30/20.
//  Copyright © 2020 Tigran. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addShopping))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(start))
        
        start()
    }
    
    @objc func start() {
        shoppingList.removeAll()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }
    
    @objc func addShopping() {
        let ac = UIAlertController(title: "Add shopping list item ", message: "type on text field", preferredStyle: .alert)
        ac.addTextField()
    
        let action = UIAlertAction(title: "add", style: .default) {
            [weak self,weak ac] _ in
            if let text = ac?.textFields?[0].text {
                self?.shoppingList.insert(text, at: 0)
                let indexPath = IndexPath(row: 0, section: 0)
                self?.tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
        
        ac.addAction(action)
        present(ac,animated: true)
        
    }
    
    


}

