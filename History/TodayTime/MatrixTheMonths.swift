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
    static func EvaluationData( swift:String,Year:String) -> [Evaluation] {
            var evaluation = [Evaluation]()
            var numberDays = 0
        switch swift.converHindiDigits{
            case "01","03","05","08","10","12 ":
                numberDays = 31
            case "04","06","07","09","11" :
                numberDays =  30
            case "02":
                numberDays = 29
               
                
            default:
             print(swift.converHindiDigits,333)
            }
        print(numberDays,2)
           // evaluation.removeAll()
        for item in 1 ..< numberDays + 1 {
            print(numberDays,item)
         let swiftDebutDateComponents = DateComponents(
          year: Int(Year),
          month:  Int(swift),
          day:  item
        )
         
        let swiftDebutDate = userCalendar.date(from: swiftDebutDateComponents)!
         let myFormatter = DateFormatter()

        myFormatter.dateStyle = .full
        let evaluationd = myFormatter.string(from: swiftDebutDate)
        let array = evaluationd.components(separatedBy: " ")
        let today2  =  array[0]
        let today = today2.replacingOccurrences(of: ",", with: "")
        let number2  =  array[2]
        let number = number2.replacingOccurrences(of: ",", with: "")
       evaluation.append(Evaluation.init(month: array[1] , today:today, number: "\(item)", year: array[3]))
           
        }
        print(evaluation)
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
    static func  Today()-> String {
        var todayString:String?
        let year = ConvertAnumberYear(ReservationsTime.Years())
        let month = ConvertAnumberMonth(ReservationsTime.TodayByNumbers ())
        print("year!",year)
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
        print(array[0])
        let today  =  array[0]
        todayString = today.replacingOccurrences(of: "،", with: "")
        
        return todayString ?? ""
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
    static func AllMonthsFunc(month: String) -> [Evaluation]{

        var MonthsaryData = [Evaluation]()
              let name = MatrixTheMonths.EvaluationData(swift: month, Year:  ReservationsTime.Years().convertHindiDigits)
        MonthsaryData.append(contentsOf: name)
        
        return MonthsaryData
    }

    static func hashtags(in string: String) -> [String] {
        let words = string.components(
            separatedBy: .whitespacesAndNewlines
        )

        // Filter lets us remove any elements that don't fit a
        // given requirement, in this case those that don't start
        // with a leading hash character:
        return words.filter { $0.starts(with: "l") }
    }
    static func ConvertAnumberMonth(_ History:String) -> Int {
      guard let month = Int(History.convertHindiDigits) else {
           return 0
        }

        return month
      //  return  HistoryInt!
    }
    static func ConvertAnumberYear(_ History:String) -> Int {
        guard let year = Int(History.convertHindiDigits) else {
             return 0
          }

          return year
    }
}
extension String {
    var convertHindiDigitsyear: String {
        var str = self
        let map = ["٢٠٢١": "2021",
                   "٢٠٢٢": "2022",
                   "٢٠٢٣": "2023",
                   "٢٠٢٤": "2024",
                   "٢٠٢٥": "2025",
                   "٢٠٢٦": "2026",
                   "٢٠٢٧": "2027",
                   "٢٠٢٨": "2028",
                   "٢٠٢٩": "2029",
                   "٢٠٣٠": "2030",
                   "٢٠٣١": "2031",
                   "٢٠٣٢": "2032"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    var convertHindiDigits: String {
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9",
            "PM":"م",
            "AM":"ص",
            "/":"-"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    
    var openAnother: String {
        var str = self
        let map = ["/": "="]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    var converHindiDigits: String {
        var str = self
        let map = ["٠٠": "0",
                   "٠١": "01",
                   "٠٢": "02",
                   "٠٣": "03",
                   "٠٤": "04",
                   "٠٥": "05",
                   "٠٦": "06",
                   "٠٧": "07",
                   "٠٨": "08",
                   "٠٩": "09",
                   "١٠": "10",
                   "١١": "11",
                   "١٢": "12",
            "PM":"م",
            "AM":"ص",
            "/":"-"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
}
