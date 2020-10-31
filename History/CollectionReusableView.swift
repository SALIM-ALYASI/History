//
//  CollectionReusableView.swift
//  History
//
//  Created by ALYASI on 10/29/20.
//

import UIKit

class Bookings_Collectioncell: UICollectionViewCell {
    @IBOutlet weak var cityTL: UILabel!
var Homeal :Int?
   var STRT = false
   @IBOutlet weak var viewCL: UIView!
   override func awakeFromNib() {
               super.awakeFromNib()
   
           
               if  viewCL.backgroundColor == #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)  {
                                    cityTL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                          }else{
                             cityTL.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                        }
             
            
     }
        override var isSelected: Bool {
            didSet {
        
                viewCL.backgroundColor = self.isSelected ? #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1) : .clear
               if  viewCL.backgroundColor == #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)  {
                         cityTL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
               }else{
                  cityTL.textColor =  #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
             }
             }
        }
}
