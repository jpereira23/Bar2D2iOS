//
//  ViewController.swift
//  Bar2D2
//
//  Created by Jeffery Pereira on 10/30/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var adminButton: UIButton!
    
    
    let coreDataHelper = CoreDataHelper()
    var arrayDrinks: [DrinkClass] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayDrinks = coreDataHelper.getDrinks()
        tableView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        adminButton.isHidden = true
        if !coreDataHelper.isUsers(){
            let controller = storyboard!.instantiateViewController(withIdentifier: "userViewController") as! UserViewController
            self.present(controller, animated: true, completion: nil)
        } else {
            let user = coreDataHelper.getUser()
            
            if user.isAdmin{
                adminButton.isHidden = false 
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDrinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aCell") as! CustomTableViewCell
        
        
        cell.labelDrink.text = arrayDrinks[indexPath.row].getDrinkName()
        cell.aDrink = arrayDrinks[indexPath.row]
        
        return cell
    }
}

