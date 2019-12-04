//
//  UserViewController.swift
//  Bar2D2
//
//  Created by Jeffery Pereira on 12/2/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var enterBotIDLabel: UILabel!
    @IBOutlet weak var enterBotIDField: UITextField!
    let coreDataHelper: CoreDataHelper = CoreDataHelper()
    var isAdmin: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.isHidden = true
        enterBotIDField.isHidden = true
        enterBotIDLabel.isHidden = true
        usernameField.delegate = self
        enterBotIDField.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func isAdmin(_ sender: Any) {
        if isAdmin{
            isAdmin = false
            descriptionLabel.isHidden = true
            enterBotIDField.isHidden = true
            enterBotIDLabel.isHidden = true
        } else {
            isAdmin = true
            descriptionLabel.isHidden = false
            enterBotIDField.isHidden = false
            enterBotIDLabel.isHidden = false
        }
    }
    
    @IBAction func done(_ sender: Any) {
        let username = usernameField.text
        let botID = enterBotIDField.text
        
    
        coreDataHelper.saveUser(username: username!, isAdmin: isAdmin, botID: botID!)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
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
