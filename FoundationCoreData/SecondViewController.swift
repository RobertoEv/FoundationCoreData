//
//  SecondViewController.swift
//  FoundationCoreData
//
//  Created by Roberto Evangelista da Silva Filho on 30/11/2018.
//  Copyright © 2018 Roberto Evangelista da Silva Filho. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var myPerson: UITextField!
    @IBAction func savingNewPerson(_ sender: Any) {
       var newPerson = Person(context: CoreDataManager.context)
        newPerson.name = myPerson.text!
        CoreDataManager.saveContext()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
