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
    var monthNumber = [Months]()
    var years = Int(TodayTime.Years().convertHindiDigits)
    var isSelectedOtherCity = false
    var lastIndexPathCitySelected:IndexPath = IndexPath()
    @IBOutlet weak var monthscollectionView: UICollectionView!
    @IBOutlet weak var evaluationcollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        historyAeri.append(contentsOf:MatrixTheMonths.EvaluationData( month:TodayTime.TodayByNumbers ().convertHindiDigits, Year:years ?? 2020 ))
       
        monthName =  TodayTime.TodayNumbers ()
        monthNumber.append(contentsOf:  MatrixTheMonths.namesMonths(Year: years ?? 2020) )
       
        title =  TodayTime.dateNow() 
        DateDisplayLabel.text = "\(TodayTime.TodayNumbers ())"
        monthscollectionView.showsHorizontalScrollIndicator = false
        monthscollectionView.showsVerticalScrollIndicator = false
    
  
}
    
}
extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource  ,UICollectionViewDelegateFlowLayout{
  
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == monthscollectionView {
            return 12
        }else{
            return historyAeri.count
        }
       
      }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == monthscollectionView {
         
            let cell = monthscollectionView.dequeueReusableCell(withReuseIdentifier: "Monthscell", for: indexPath) as! Monthscell
           // cell.transform = CGAffineTransform(scaleX: -1, y: 1)
            if !isSelectedOtherCity && indexPath.row + 1 == Int(TodayTime.TodayByNumbers ().convertHindiDigits){
                cell.monthView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
               cell.monthView.layer.cornerRadius = 15
               cell.monthView.layer.borderWidth = 1.5
                
                cell.monthLabel.textColor = .white
                lastIndexPathCitySelected = indexPath
            }
            cell.monthLabel.text =   monthNumber[indexPath.row].month
          
            cell.Homeal = indexPath.row
            cell.monthView.layer.cornerRadius = 15
            cell.monthView.layer.borderWidth = 1.5
            cell.monthView.layer.borderColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)

            return cell
        }else{
            
            if indexPath.row + 1 == Int(TodayTime.Todaydaynumber().convertHindiDigits) && TodayTime.TodayNumbers()  == historyAeri[indexPath.row].number && TodayTime.Years().convertHindiDigits == historyAeri[indexPath.row].year?.convertHindiDigits{
            let cell = evaluationcollectionView.dequeueReusableCell(withReuseIdentifier: "RightNowCell", for: indexPath) as! RightNowCell
                
                if historyAeri[indexPath.row].number ?? ""  == "1"{
                       
                    cell.rightBayTodayLabel.text = ""
                    cell.rightTodayLabel.text =  ""
                 cell.rightthebackgroundView.layer.cornerRadius = 15
                 cell.rightthebackgroundView.layer.borderWidth = 1.5
                     cell.rightthebackgroundView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }else{
                    cell.rightBayTodayLabel.text = historyAeri[indexPath.row].month
                    cell.rightTodayLabel.text =  historyAeri[indexPath.row].today
                    cell.rightthebackgroundView.layer.cornerRadius = 15
                    cell.rightthebackgroundView.layer.borderWidth = 1.5
                    cell.rightthebackgroundView.layer.borderColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
                }
                return cell
            }else{
                let cell = evaluationcollectionView.dequeueReusableCell(withReuseIdentifier: "DaysMonthCell", for: indexPath) as! DaysMonthCell
                if historyAeri[indexPath.row].number ?? ""  == "1"{
                    cell.todaysDateLabel.text  = ""
                 cell.todaysLabel.text =  ""
                 cell.backgroundview.layer.cornerRadius = 15
                 cell.backgroundview.layer.borderWidth = 1.5
                     cell.backgroundview.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }else{
                 
            
            cell.todaysDateLabel.text = historyAeri[indexPath.row].month
            cell.todaysLabel.text =  historyAeri[indexPath.row].today
            cell.backgroundview.layer.cornerRadius = 15
            cell.backgroundview.layer.borderWidth = 1.5
                cell.backgroundview.layer.borderColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
                }
             
                        return cell
            }
          
            }
      
        
    
    
    
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == monthscollectionView {
            self.historyAeri.removeAll()
        isSelectedOtherCity = true
            if lastIndexPathCitySelected != nil{
               
                monthName =   monthNumber[indexPath.row].month ?? ""
                historyAeri.append(contentsOf:MatrixTheMonths.EvaluationData( month:"\(indexPath.row + 1)", Year:years ?? 2020 ))
               

                self.evaluationcollectionView.reloadData()
                print( "\(indexPath.row + 1)")
                DateDisplayLabel.text = "\(monthName)"
                return
                 }
            print(5855,MatrixTheMonths.Today(month: indexPath.row + 1, year: 2020))
        let lastCellSelected =  monthscollectionView.cellForItem(at: lastIndexPathCitySelected ) as! Monthscell
           // print(indexPath.row)
        lastCellSelected.monthLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lastCellSelected.monthView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
       lastCellSelected.monthView.layer.cornerRadius = 15
       lastCellSelected.monthView.layer.borderWidth = 1.5
        let cell = monthscollectionView.dequeueReusableCell(withReuseIdentifier: "Monthscell", for: indexPath) as! Monthscell
       cell.monthLabel.layer.cornerRadius = 15
              cell.monthLabel.layer.borderWidth = 1.5
        cell.monthLabel.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            print(indexPath.row + 1)
           monthName =    monthNumber[indexPath.row].month ?? ""
            historyAeri.append(contentsOf:MatrixTheMonths.EvaluationData( month:"\(indexPath.row + 1)", Year:years ?? 2020 ))
           self.evaluationcollectionView.reloadData()
        lastIndexPathCitySelected = indexPath
           
        }else{
           
           
            DateDisplayLabel.text = "\(historyAeri[indexPath.row].today ?? "")"
        }
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return (monthscollectionView.indexPathsForSelectedItems?.count ?? 0) < 2
    }
  
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 5

        }
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return  1
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
  
}
