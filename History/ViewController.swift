//
//  ViewController.swift
//  History
//
//  Created by ALYASI on 10/29/20.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    var hourArry = [Hour]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hourData()
        Label.text = "\(ReservationsTime.Fetchtodaydate())"
    }
    @IBAction func historyIntButton(_ sender: UIButton) {
        let alert = Reservations().alert()

       self.present(alert, animated: true)
    }
    func hourData()  {
        for hourD in 1 ... 11 {
              
                let hour = ReservationsTime.hour()
                let array = hour.components(separatedBy: ",")
               let month  =  array[0]
            let time  =  array[1]
            if month.convertHindiDigits == "\(hourD)" && time == "AM".localized{
                    hourArry.append(Hour.init(hour: "\(hourD)", time: "AM".localized, timeYeah: true))
                }else{
                    hourArry.append(Hour.init(hour: "\(hourD)", time:"AM".localized, timeYeah: false))
                }
                     }
        let hour = ReservationsTime.hour()
        let array = hour.components(separatedBy: ",")
       let month  =  array[0]
        let time  =  array[1]
        print(time)
        if month.convertHindiDigits == "\(12)" && time == "PM".localized {
            hourArry.append(Hour.init(hour: "\(12)", time: "الظهيرة", timeYeah: true))
        }else{
            hourArry.append(Hour.init(hour: "\(12)", time: "الظهيرة", timeYeah: false))
        }
        for hourD in 1 ... 11 {
              
                let hour = ReservationsTime.hour()
                let array = hour.components(separatedBy: ",")
               let month  =  array[0]
            let time  =  array[1]
            if month.convertHindiDigits == "\(hourD)" && time == "PM".localized{
                    hourArry.append(Hour.init(hour: "\(hourD)", time: "PM".localized, timeYeah: true))
                }else{
                    hourArry.append(Hour.init(hour: "\(hourD)", time: "PM".localized, timeYeah: false))
                }
             
        }
       
    if month.convertHindiDigits == "\(12)" && time == "AM".localized{
            hourArry.append(Hour.init(hour: "\(12)", time: "AM".localized, timeYeah: true))
        }else{
            hourArry.append(Hour.init(hour: "\(12)", time:"AM".localized, timeYeah: false))
        }
    }
}
extension ViewController:UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hourArry.count
    }
 
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if hourArry[indexPath.row].timeYeah == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HourCell") as! HourCell
        
         cell.hourLabel.text = "\(hourArry[indexPath.row].hour ?? "") \(hourArry[indexPath.row].time ?? "")"
         
        // cell.hourLabel.text = "\(indexPath.row + 1) ص"
         return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HourNowcell") as! HourNowcell
        
         cell.hourLabel.text = "\(hourArry[indexPath.row].hour ?? "") \(hourArry[indexPath.row].time ?? "")"
         
        // cell.hourLabel.text = "\(indexPath.row + 1) ص"
         return cell
        }
         
    }
  
    private func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath){
        //if collectionView ==    tableView{
            let alert = Reservations().alert()

           self.present(alert, animated: true)
         //    }
//        هدا كود نقل بيانات
      

        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        let alert = Reservations().alert()

       self.present(alert, animated: true)
        
    }
        }
 
