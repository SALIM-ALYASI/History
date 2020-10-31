//
//  MatrixTheMonths.swift
//  History
//
//  Created by ALYASI on 10/29/20.
//

import UIKit
class MatrixTheMonths {
    static let historyt31 = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    static let historyt30 = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]
    static let historyt28 = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28"]
    static let historyt29 = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29"]
    static var historyAeri = [String]()
//    Determine the number of days of the current month
    
    
    
    static func DaysDonth(_ Month:String) -> [String] {
      
        // let timestamp = TodayTime.TodayByNumbers()
        switch Month {
        case "1":
         
            historyAeri.append(contentsOf: historyt31)
        case "2":
         
            if TodayTime.Years().convertHindiDigits == "2020" {
                historyAeri.append(contentsOf: historyt29)
                print(2)
            }else{
                historyAeri.append(contentsOf: historyt28)
            }
             
            
        case "3":
           
            historyAeri.append(contentsOf: historyt31)
        case "4":
            
             historyAeri.append(contentsOf: historyt30)
        case "5":
          historyAeri.append(contentsOf: historyt31)
        case "6":
           historyAeri.append(contentsOf: historyt30)
        case "7":
            historyAeri.append(contentsOf: historyt30)
        case "8":
           historyAeri.append(contentsOf: historyt31)
        case "9":
           historyAeri.append(contentsOf: historyt30)
        case "10":
            historyAeri.append(contentsOf: historyt31)
        case "11":
             historyAeri.append(contentsOf: historyt30)
        case "12":
            historyAeri.append(contentsOf: historyt31)
        default:
          print(Month)
        }
        
        return historyAeri
    }
    static func namesMonths() -> [String] {
        let month = ["January","February","March","April","May","June","July","August","september","October","November","December"]

               let monthearaic = ["مارس","فبراير","ينارير","ابريل","مايو","يونيو","يوليو","اغسطس","سبتمبر","اكتوبر","نوفمبر","ديسمبر"]
        var monthNumber = [String]()
        if Locale.current.languageCode == "ar" {
            monthNumber.append(contentsOf: monthearaic)
        }else{
            monthNumber.append(contentsOf: month)
        }
        return monthNumber
    }
    static  func namestoday() -> [String] {
        let dayEng = ["Saturday","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday"]
        let days = ["السبت","الاحد","الاثنين","الثلاثاء","الاربعاء","الخميس","الجمعه"]
        var todayNumber = [String]()
        if Locale.current.languageCode == "ar" {
            todayNumber.append(contentsOf: days)
        }else{
            todayNumber.append(contentsOf: dayEng)
        }
       
        return todayNumber
    }
    static func EvaluationData( month:String) -> [Evaluation] {
        let userCalendar = Calendar.current
        var evaluation = [Evaluation]()
        switch month {
        case "1","3","5","8","10":
            for r in 0 ... 31 {
                
                let swiftDebutDateComponents = DateComponents(
                  year: 2020,
                  month: Int(month),
                  day: r
                )
                 
                // 3
                let swiftDebutDate = userCalendar.date(from: swiftDebutDateComponents)!
                let myFormatter = DateFormatter()
                print("Swift’s debut date, via the DateFormatter: \(myFormatter.string(from: swiftDebutDate))")
                 
                myFormatter.dateStyle = .full
                let evaluationd = myFormatter.string(from: swiftDebutDate)
                let array = evaluationd.components(separatedBy: " ")
                var today  =  array[0]
                today = today.replacingOccurrences(of: "،", with: "")
                let name = Evaluation.init(month: array[1], today: today, number: array[3])
                
                evaluation.append(name)
            }

        case "4","6","7","9" ,"11":
            for r in 0 ... 30 {
                
                let swiftDebutDateComponents = DateComponents(
                  year: 2020,
                  month: Int(month),
                  day: r
                )
                 
                // 3
                let swiftDebutDate = userCalendar.date(from: swiftDebutDateComponents)!
                let myFormatter = DateFormatter()
                print("Swift’s debut date, via the DateFormatter: \(myFormatter.string(from: swiftDebutDate))")
                 
                myFormatter.dateStyle = .full
                let evaluationd = myFormatter.string(from: swiftDebutDate)
                let array = evaluationd.components(separatedBy: " ")
                var today  =  array[0]
                today = today.replacingOccurrences(of: "،", with: "")
                let name = Evaluation.init(month: array[1], today: today, number: array[3])
                
                evaluation.append(name)
            }
        case "2":
            for r in 0 ... 29 {
                
                let swiftDebutDateComponents = DateComponents(
                  year: 2020,
                  month: Int(month),
                  day: r
                )
                 
                // 3
                let swiftDebutDate = userCalendar.date(from: swiftDebutDateComponents)!
                let myFormatter = DateFormatter()
                print("Swift’s debut date, via the DateFormatter: \(myFormatter.string(from: swiftDebutDate))")
                 
                myFormatter.dateStyle = .full
                let evaluationd = myFormatter.string(from: swiftDebutDate)
                let array = evaluationd.components(separatedBy: " ")
                var today  =  array[0]
                today = today.replacingOccurrences(of: "،", with: "")
                let name = Evaluation.init(month: array[1], today: today, number: array[3])
                
                evaluation.append(name)
            }
            
        default:
            break
        }
       
      
        return evaluation
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
