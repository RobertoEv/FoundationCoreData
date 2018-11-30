//
//  ViewController.swift
//  FoundationCoreData
//
//  Created by Roberto Evangelista da Silva Filho on 30/11/2018.
//  Copyright © 2018 Roberto Evangelista da Silva Filho. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var personList: [Person]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        self.personList = try? CoreDataManager.context.fetch(fetchRequest)
        
//        self.personList?.last?.name = "Davi"
        CoreDataManager.saveContext()
    
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = personList?[indexPath.row]
        cell.textLabel?.text = person?.name
        return cell
    }
}
