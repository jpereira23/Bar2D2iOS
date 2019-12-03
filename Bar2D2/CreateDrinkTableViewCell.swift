//
//  CreateDrinkTableViewCell.swift
//  Bar2D2
//
//  Created by Jeffery Pereira on 11/19/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit


protocol CreateDrinkTableViewCellDelegate{
    func valueChanged(index: Int, value: Int)
}
class CreateDrinkTableViewCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var slotText: UILabel!
    public var numValue: Int = 0
    public var aDelegate: CreateDrinkTableViewCellDelegate?
    public var index: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 20.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    public func initDrinkClass(){
        
    }
    @IBAction func valueChanged(_ sender: UIStepper) {
        numberLabel.text = Int(sender.value).description
        numValue = Int(sender.value)
        aDelegate?.valueChanged(index: index, value: numValue)
    }
    
    
}
