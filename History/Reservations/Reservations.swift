//
//  Reservations.swift
//  History
//
//  Created by ALYASI on 21/02/2021.
//

import UIKit

class Reservations{
  func alert()->ReservationsViewController{
        let storyBoard = UIStoryboard(name: "Reservations", bundle: .main)
        let alertVC = storyBoard.instantiateViewController(withIdentifier: "ReservationsViewController") as! ReservationsViewController
        
      return alertVC
    }
    
}
