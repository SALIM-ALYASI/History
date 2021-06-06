//
//  TodayTime.swift
//  History
//
//  Created by ALYASI on 10/29/20.
//

import UIKit
class  ReservationsTime {
    static let timestamp = NSDate().timeIntervalSince1970
    //جلب اسم شهر
  static func TodayNumbers () -> String {
    
     let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
          let dateFormatter = DateFormatter()
          dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
          dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
    
       dateFormatter.dateFormat = "MMMM"

         return dateFormatter.string(from: date)
     }
    //جاب شهر بلارقام
  static func TodayByNumbers () -> String {
     let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
          let dateFormatter = DateFormatter()
          dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
          dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
    
       dateFormatter.dateFormat = "MM"

         return dateFormatter.string(from: date)
     }
 
//    جلب ايام الاسبوع
    static func Todayday() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
      
         dateFormatter.dateFormat = "EEEE"

           return dateFormatter.string(from: date)
       }
//     جلب يوم برقم
    static func Todaydaynumber() -> String {
       let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
      
         dateFormatter.dateFormat = "d"

           return dateFormatter.string(from: date)
       }
    //جلب سنة
    static func Years() -> String {
       let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
      
         dateFormatter.dateFormat = "yyy"

           return dateFormatter.string(from: date)
       }
//    جلب السنه وشهر واليوم
       static func dateNow() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
             let dateFormatter = DateFormatter()
             dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
             dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
       
          dateFormatter.dateFormat = "yyyy MMM EEEE"

            return dateFormatter.string(from: date)
        }

//     h:mm a
    static func hour() -> String {
     let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
          let dateFormatter = DateFormatter()
          dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
          dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
    
       dateFormatter.dateFormat = "h,a"

         return dateFormatter.string(from: date)
     }
//    EEEE, MMM d, yyyy
    static func Fetchtodaydate() -> String {
     let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
          let dateFormatter = DateFormatter()
          dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
          dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
    
       dateFormatter.dateFormat = "EEEE, MMM d, yyyy"

         return dateFormatter.string(from: date)
     }
}
