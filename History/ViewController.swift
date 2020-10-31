//
//  ViewController.swift
//  History
//
//  Created by ALYASI on 10/29/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var DateDisplayLabel: UILabel!
  
    var historyAeri =  [Evaluation]()
  var monthName = ""
    var monthNumber = [String]()
    var todayNumber = [String]()
    var isSelectedOtherCity = false
    var lastIndexPathCitySelected:IndexPath = IndexPath()
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        historyAeri.append(contentsOf:MatrixTheMonths.EvaluationData( month:TodayTime.TodayByNumbers().convertHindiDigits))
        monthName =  TodayTime.TodayNumbers ()
        monthNumber.append(contentsOf:  MatrixTheMonths.namesMonths() )
       
        title = "\(TodayTime.TodayNumbers ()),\(TodayTime.Todayday()),\(TodayTime.Todaydaynumber())"
        DateDisplayLabel.text = "\(TodayTime.TodayNumbers ()),\(TodayTime.Todaydaynumber())"
        collectionView2.showsHorizontalScrollIndicator = false
        collectionView2.showsVerticalScrollIndicator = false
    
  
}
}
extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource  ,UICollectionViewDelegateFlowLayout{
  
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView2 {
            return 12
        }else{
            return historyAeri.count
        }
       
      }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView2 {
         
            let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: "Bookings_Collectioncell", for: indexPath) as! Bookings_Collectioncell
           // cell.transform = CGAffineTransform(scaleX: -1, y: 1)
            if !isSelectedOtherCity && indexPath.row + 1 == Int(TodayTime.TodayByNumbers ().convertHindiDigits){
                cell.viewCL.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
               cell.viewCL.layer.cornerRadius = 15
               cell.viewCL.layer.borderWidth = 1.5
                cell.cityTL.textColor = .white
                lastIndexPathCitySelected = indexPath
            }
            cell.cityTL.text =   monthNumber[indexPath.row]
          
            cell.Homeal = indexPath.row
            cell.viewCL.layer.cornerRadius = 15
            cell.viewCL.layer.borderWidth = 1.5
            cell.viewCL.layer.borderColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)

            return cell
        }else{
            if historyAeri[indexPath.row].month == TodayTime.Todaydaynumber().convertHindiDigits && monthName == TodayTime.TodayNumbers () {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryCell2", for: indexPath) as! HistoryCell
       
                cell.dayLabel2.text = TodayTime.Todayday()
                cell.historyLabel2.text = TodayTime.Todaydaynumber()
                cell.viewCL2.layer.cornerRadius = 15
                //cell.viewCL2.layer.borderWidth = 1.5
                
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
                cell.dayLabel.text = "\(historyAeri[indexPath.row].number ?? "") \n \(historyAeri[indexPath.row].month ?? "")" 
                cell.historyLabel.text =  historyAeri[indexPath.row].today
                cell.viewCL.layer.cornerRadius = 15
                cell.viewCL.layer.borderWidth = 1.5
                cell.viewCL.layer.borderColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
             
                        return cell
            }
          
            }
      
        
    
    
    
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView2 {
            self.historyAeri.removeAll()
        isSelectedOtherCity = true
            if lastIndexPathCitySelected != nil{
               
                monthName =   monthNumber[indexPath.row]
            // BringDate(Month: indexPath.row)
                historyAeri.append(contentsOf:MatrixTheMonths.EvaluationData( month:"\(indexPath.row + 1)"))
                self.collectionView.reloadData()
                DateDisplayLabel.text = "\(monthName)"
                return
                 }
            print(2,lastIndexPathCitySelected)
        let lastCellSelected =  collectionView2.cellForItem(at: lastIndexPathCitySelected ) as! Bookings_Collectioncell
           // print(indexPath.row)
        lastCellSelected.cityTL.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        lastCellSelected.viewCL.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
       lastCellSelected.viewCL.layer.cornerRadius = 15
       lastCellSelected.viewCL.layer.borderWidth = 1.5
        let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: "Bookings_Collectioncell", for: indexPath) as! Bookings_Collectioncell
       cell.viewCL.layer.cornerRadius = 15
              cell.viewCL.layer.borderWidth = 1.5
        cell.viewCL.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
           monthName =   monthNumber[indexPath.row]
            historyAeri.append(contentsOf:MatrixTheMonths.EvaluationData( month:"\(indexPath.row + 1)"))
        self.collectionView.reloadData()
        lastIndexPathCitySelected = indexPath
           
        }else{
           
           
            DateDisplayLabel.text = "\(monthName),\(historyAeri[indexPath.row])"
        }
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return (collectionView2.indexPathsForSelectedItems?.count ?? 0) < 2
    }

 
}


extension String {
    
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
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    var convDigits: String {
        var str = self
        let map = ["،": " "]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
}
