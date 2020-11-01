//
//  MatrixTheMonths.swift
//  History
//
//  Created by ALYASI on 10/29/20.
//

import UIKit
class MatrixTheMonths {
  
    static func EvaluationData( month:String,Year:Int) -> [Evaluation] {
        let userCalendar = Calendar.current
        var evaluation = [Evaluation]()
        let Today = 1
        var numberDays = 0
        switch month {
        case "1","3","5","8","10","12":
            numberDays = 31
        case "4","6","7","9" ,"11":
            numberDays =  30
        case "2":
            if TodayTime.Years().convertHindiDigits == "2020" || TodayTime.Years().convertHindiDigits == "2024"  || TodayTime.Years().convertHindiDigits == "2028"{
                numberDays = 29
            }else{
                numberDays = 28
            }
           
            
        default:
          break
        }
        for r in 0 ..< numberDays {
            
            let swiftDebutDateComponents = DateComponents(
              year: Year,
              month: Int(month),
              day:  Today + r
            )
             
            // 3
            let swiftDebutDate = userCalendar.date(from: swiftDebutDateComponents)!
            let myFormatter = DateFormatter()
           
            myFormatter.dateStyle = .full
            let evaluationd = myFormatter.string(from: swiftDebutDate)
            let array = evaluationd.components(separatedBy: " ")
            var today  =  array[0]
            today = today.replacingOccurrences(of: "،", with: "")
            var month  =  array[2]
            month = month.replacingOccurrences(of: "،", with: "")
            let name = Evaluation.init(month: array[1], today: today, number: month)
            
            evaluation.append(name)
        }
      
        return evaluation
    }
  
    static func namesMonths(Year:Int) -> [Months] {
        let userCalendar = Calendar.current
        var Monthsary = [Months]()
        for r in 1 ... 12 {
            
            let swiftDebutDateComponents = DateComponents(
              year: Year,
              month: r,
              day: 1
            )
             
            // 3
            let swiftDebutDate = userCalendar.date(from: swiftDebutDateComponents)!
            let myFormatter = DateFormatter()
          
            myFormatter.dateStyle = .full
            let evaluationd = myFormatter.string(from: swiftDebutDate)
            let array = evaluationd.components(separatedBy: " ")
          
            var month  =  array[2]
            month = month.replacingOccurrences(of: "،", with: "")
            let name = Months.init(month: month)
            
            Monthsary.append(name)
        }
        return Monthsary
    }
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
struct Evaluation {
    var month: String?
    var today: String?
    var number: String?
    
}
struct Months {
    var month: String?
   
    
}
