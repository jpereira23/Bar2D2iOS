//
//  NewDrinkViewController.swift
//  Bar2D2
//
//  Created by Jeffery Pereira on 10/30/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class NewDrinkViewController: UIViewController, UITextFieldDelegate {
    
    let coreDataHelper = CoreDataHelper()
    
    
    @IBOutlet weak var drinkName: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var arrayOfSlots: [String] = ["Slot One", "Slot Two", "Slot Three", "Slot Four", "Slot Five" , "Slot Six", "Slot Seven", "Slot Eight", "Slot Nine", "Slot Ten", "Slot Eleven", "Slot Twelve", "Slot Thirteen", "Slot Fourteen", "Slot Fifteen"]
    var arrayOfValues: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    override func viewDidLoad() {
        super.viewDidLoad()
        drinkName.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addDrink(_ sender: Any) {
        var aDrinkName = drinkName.text
    
        let aDrink = DrinkClass(name: aDrinkName!, slots: arrayOfValues)
        
        coreDataHelper.saveDrink(drink: aDrink)
        
        self.dismiss(animated: true, completion: nil)
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        drinkName.resignFirstResponder()
        
        return true
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

extension NewDrinkViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aCell") as! CreateDrinkTableViewCell
        cell.slotText.text = arrayOfSlots[indexPath.row]
        cell.index = indexPath.row
        cell.aDelegate = self
        return cell
    }
}

extension NewDrinkViewController: CreateDrinkTableViewCellDelegate{
    func valueChanged(index: Int, value: Int){
        arrayOfValues[index] = value
    }
}
