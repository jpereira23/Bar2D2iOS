//
//  CustomTableViewCell.swift
//  Bar2D2
//
//  Created by Jeffery Pereira on 11/16/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDrink: UILabel!
    var aDrink: DrinkClass!
    var outputStream: OutputStream!
    override func awakeFromNib() {
        super.awakeFromNib()
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?

        // 2
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,
                                           "138.197.205.247" as CFString,
                                           8080,
                                           &readStream,
                                           &writeStream)
        
        outputStream = writeStream?.takeRetainedValue()
        outputStream.schedule(in: .current, forMode: .common)
        outputStream.open()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func makeDrink(_ sender: Any) {
        if aDrink != nil{
            let arrayOfDrinks: [Int] = aDrink.getArrayOfSlots()
            let jsonObject: [String: Any] = ["drinkName": aDrink.getDrinkName(),
                "slot1": String(arrayOfDrinks[0]),
                "slot2": String(arrayOfDrinks[1]),
                "slot3": String(arrayOfDrinks[2]),
                "slot4": String(arrayOfDrinks[3]),
                "slot5": String(arrayOfDrinks[4]),
                "slot6": String(arrayOfDrinks[5]),
                "slot7": String(arrayOfDrinks[6]),
                "slot8": String(arrayOfDrinks[7]),
                "slot9": String(arrayOfDrinks[8]),
                "slot10": String(arrayOfDrinks[9]),
                "slot11": String(arrayOfDrinks[10]),
                "slot12": String(arrayOfDrinks[11]),
                "slot13": String(arrayOfDrinks[12]),
                "slot14": String(arrayOfDrinks[13]),
                "slot15": String(arrayOfDrinks[14])]
            

            let jsonData: Data

            do {
                jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: JSONSerialization.WritingOptions()) as Data
                let jsonString = NSString(data: jsonData as Data, encoding: String.Encoding.utf8.rawValue) as! String
                jsonData.withUnsafeBytes { outputStream.write($0, maxLength: jsonData.count)}

            } catch _ {
                print ("JSON Failure")
            }
        }
    }
    
}
