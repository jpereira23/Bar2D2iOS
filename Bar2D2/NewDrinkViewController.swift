//
//  NewDrinkViewController.swift
//  Bar2D2
//
//  Created by Jeffery Pereira on 10/30/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class NewDrinkViewController: UIViewController {

    @IBOutlet weak var drinkName: UITextField!
    @IBOutlet weak var slotOne: UITextField!
    @IBOutlet weak var slotTwo: UITextField!
    @IBOutlet weak var slotThree: UITextField!
    @IBOutlet weak var slotFour: UITextField!
    @IBOutlet weak var slotFive: UITextField!
    @IBOutlet weak var slotSix: UITextField!
    @IBOutlet weak var slotSeven: UITextField!
    @IBOutlet weak var slotEight: UITextField!
    @IBOutlet weak var slotNine: UITextField!
    @IBOutlet weak var slotTen: UITextField!
    @IBOutlet weak var slotEleven: UITextField!
    @IBOutlet weak var slotTwelve: UITextField!
    @IBOutlet weak var slotThirteen: UITextField!
    @IBOutlet weak var slotFourteen: UITextField!
    @IBOutlet weak var slotFifteen: UITextField!
    
    let coreDataHelper = CoreDataHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addDrink(_ sender: Any) {
        var aDrinkName = drinkName.text
        var arrayOfSlots: [Int] = []
        arrayOfSlots.append(slotOne!.text)
        arrayOfSlots.append(slotTwo!.text)
        arrayOfSlots.append(slotThree!.text)
        arrayOfSlots.append(slotFour!.text)
        arrayOfSlots.append(slotFive!.text)
        arrayOfSlots.append(slotSix!.text)
        arrayOfSlots.append(slotSeven!.text)
        arrayOfSlots.append(slotEight!.text)
        arrayOfSlots.append(slotNine!.text)
        arrayOfSlots.append(slotTen!.text)
        arrayOfSlots.append(slotEleven!.text)
        arrayOfSlots.append(slotTwelve!.text)
        arrayOfSlots.append(slotThirteen!.text)
        arrayOfSlots.append(slotFourteen!.text)
        arrayOfSlots.append(slotFifteen!.text)
        let aDrink = DrinkClass(name: aDrinkName!, slots: arrayOfSlots)
        
        CoreDataHelper.saveDrink(aDrink)
        
        self.dismiss(animated: true, completion: nil)
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
