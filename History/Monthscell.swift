//
//  CollectionReusableView.swift
//  History
//
//  Created by ALYASI on 10/29/20.
//

import UIKit

class Monthscell: UICollectionViewCell {
    @IBOutlet weak var monthLabel: UILabel!
var Homeal :Int?
   var STRT = false
   @IBOutlet weak var monthView: UIView!
   override func awakeFromNib() {
               super.awakeFromNib()
   
           
               if  monthView.backgroundColor == #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)  {
                monthLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                          }else{
                            monthLabel.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                        }
             
            
     }
        override var isSelected: Bool {
            didSet {
        
                monthView.backgroundColor = self.isSelected ? #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1) : .clear
               if  monthView.backgroundColor == #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)  {
                monthLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
               }else{
                monthLabel.textColor =  #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
             }
             }
        }
}
