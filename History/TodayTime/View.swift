//
//  View.swift
//  History
//
//  Created by ALYASI on 11/1/20.
//

import UIKit
extension UIView {
    func lastCellSelected(){
//        lastCellSelected.monthLabel.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1.5
        
    }
    func lastcellwasnotselectedLabel(){
        
        self.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1.5
    }}
 
class Viewclass :  UIView {
    override func didMoveToWindow() {
            self.layer.cornerRadius = 10
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 1, height: 1)
            self.layer.shadowOpacity = 0.3
            self.layer.shadowRadius = 2.0
         
     }
}
