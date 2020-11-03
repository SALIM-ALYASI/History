//
//  MatrixTheMonths.swift
//  History
//
//  Created by ALYASI on 10/29/20.
//

import UIKit
class MatrixTheMonths {
    static let userCalendar = Calendar.current
//  جلب ايام شهر
    static func EvaluationData( month:String,Year:Int) -> [Evaluation] {
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
        
        print("اليوم:",MatrixTheMonths.Today(month:Int(month) ?? 1,year:Year))
        evaluation.removeAll()
        switch MatrixTheMonths.Today(month:Int(month) ?? 1,year:Year) {
        case "Saturday".localized:
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
         case "Monday".localized:
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
        case "Tuesday".localized:
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
           
        case "Wednesday".localized:
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
          
        case "Thursday".localized:
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
           
        case "Friday".localized:
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
            evaluation.append(Evaluation.init(month:  "1", today: "1", number: "1",year:"1"))
           
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
            let name = Evaluation.init(month: array[1], today: today, number: month,year:array[3])
            
            evaluation.append(name)
        }
      
        return evaluation
    }
//  جلب اشهر سنه
    static func namesMonths(Year:Int) -> [Months] {
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
            var today  =  array[0]
            today = today.replacingOccurrences(of: "،", with: "")
            let name = Months.init(month: month, today: today)
            
            Monthsary.append(name)
        }
        return Monthsary
    }
//    جلب اول يوم في شهر
    static func  Today(month:Int,year:Int)-> String {
        let swiftDebutDateComponents = DateComponents(
          year: year,
          month: month,
          day: 1
        )
         
      
        let swiftDebutDate = userCalendar.date(from: swiftDebutDateComponents)!
        let myFormatter = DateFormatter()
      
        myFormatter.dateStyle = .full
        let evaluationd = myFormatter.string(from: swiftDebutDate)
        let array = evaluationd.components(separatedBy: " ")
      
        var today  =  array[0]
        today = today.replacingOccurrences(of: "،", with: "")
        
        return today
    }
    static func  MonthsFunc(month:Int,year:Int)-> String {
        let swiftDebutDateComponents = DateComponents(
          year: year,
          month: month,
          day: 1
        )
         
      
        let swiftDebutDate = userCalendar.date(from: swiftDebutDateComponents)!
        let myFormatter = DateFormatter()
      
        myFormatter.dateStyle = .full
        let evaluationd = myFormatter.string(from: swiftDebutDate)
        let array = evaluationd.components(separatedBy: " ")
      
        var month  =  array[2]
        month = month.replacingOccurrences(of: "،", with: "")
        
        return month
    }
    static func AllMonthsFunc() -> [AllMonths]{
        
        var MonthsaryData = [AllMonths]()
        for item in 1 ... 12 {
            let name = MatrixTheMonths.EvaluationData(month: "\(item)", Year: Int(TodayTime.Years().convertHindiDigits) ?? 2020)
            MonthsaryData.append(AllMonths.init(Month: MatrixTheMonths.MonthsFunc(month:item,year:Int(TodayTime.Years().convertHindiDigits) ?? 2020), Today: name))
        }
        return MonthsaryData
    }
    
}


