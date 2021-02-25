//
//  ReservationsCell.swift
//  History
//
//  Created by ALYASI on 21/02/2021.
//


import UIKit

class ReservationsCell: UICollectionViewCell {
    @IBOutlet weak var rightthebackgroundView: Viewclass!
    
    @IBOutlet weak var rightTodayLabel: UILabel!
    
    @IBOutlet weak var rightBayTodayLabel: UILabel!
}
//TodayCell

class TodayCell: UICollectionViewCell {
    @IBOutlet weak var rightthebackgroundView: Viewclass!
    
    @IBOutlet weak var rightTodayLabel: UILabel!
    
    @IBOutlet weak var rightBayTodayLabel: UILabel!
}
class Viewclass :  UIView {
    override func didMoveToWindow() {
            self.layer.cornerRadius = 10
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 1, height: 1)
            self.layer.shadowOpacity = 0.3
            self.layer.shadowRadius = 2.0
         
     }
}
