//
//  TodayTime.swift
//  History
//
//  Created by ALYASI on 10/29/20.
//

import UIKit
class TodayTime {
    static let timestamp = NSDate().timeIntervalSince1970
    //"MM"
  static func TodayNumbers () -> String {
    
     let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
          let dateFormatter = DateFormatter()
          dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
          dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
    
       dateFormatter.dateFormat = "MMMM"

         return dateFormatter.string(from: date)
     }
    //"MM"
  static func TodayByNumbers () -> String {
     let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
          let dateFormatter = DateFormatter()
          dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
          dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
    
       dateFormatter.dateFormat = "MM"

         return dateFormatter.string(from: date)
     }
    
    static func Todayday() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
      
         dateFormatter.dateFormat = "EEEE"

           return dateFormatter.string(from: date)
       }
//    Day with a number
    static func Todaydaynumber() -> String {
       let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
      
         dateFormatter.dateFormat = "dd"

           return dateFormatter.string(from: date)
       }
    //
    static func Years() -> String {
       let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
      
         dateFormatter.dateFormat = "yyy"

           return dateFormatter.string(from: date)
       }
    
       static func dateNow() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
             let dateFormatter = DateFormatter()
             dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
             dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
       
          dateFormatter.dateFormat = "yyyy MMM EEEE"

            return dateFormatter.string(from: date)
        }
}
