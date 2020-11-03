//
//  EvaluationViewController.swift
//  History
//
//  Created by ALYASI on 11/1/20.
//

import UIKit

class EvaluationViewController: UIViewController {
   
    var historyAeri =  [AllMonths]()
  var monthName = ""
    var monthNumber = [Months]()
    var years = Int(TodayTime.Years().convertHindiDigits)
    @IBOutlet weak var evaluationcollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        monthName =  TodayTime.TodayNumbers ()
        historyAeri.append(contentsOf: MatrixTheMonths.AllMonthsFunc())
       
        title =  TodayTime.dateNow()
       evaluationcollectionView.showsHorizontalScrollIndicator = false
        evaluationcollectionView.showsVerticalScrollIndicator = false
//        historyAeri.append(contentsOf: //)
}
    
    func tothrow() -> String {
        var day = ""
        let todayday =  TodayTime.Todaydaynumber().convertHindiDigits
        let array = Array(todayday)
        if array[0] == "0" {
            day = "\(array[1])"
        }else{
            day = todayday
        }
         return day
    }
}
extension EvaluationViewController:UICollectionViewDelegate, UICollectionViewDataSource  ,UICollectionViewDelegateFlowLayout{
   
    
  
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return historyAeri.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return historyAeri[section].Today.count
        
       
      }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let friendHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "EvaluationCollectionReusableView", for: indexPath) as! EvaluationCollectionReusableView
        
        friendHeader.monthLabel.layer.cornerRadius = 15
        friendHeader.monthLabel.layer.shadowColor = UIColor.black.cgColor
        friendHeader.monthLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
        friendHeader.monthLabel.layer.shadowOpacity = 0.3
        friendHeader.monthLabel.layer.shadowRadius = 2.0
        friendHeader.monthLabel.text = historyAeri[indexPath.section].Month

        return friendHeader
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if tothrow() == historyAeri[indexPath.section].Today[indexPath.row].month!.convertHindiDigits && historyAeri[indexPath.section].Today[indexPath.row].today == TodayTime.Todayday().convertHindiDigits && historyAeri[indexPath.section].Today[indexPath.row].year == TodayTime.Years() && TodayTime.TodayNumbers () == historyAeri[indexPath.section].Today[indexPath.row].number {
        let cell = evaluationcollectionView.dequeueReusableCell(withReuseIdentifier: "EvaluatioRightNowCell", for: indexPath) as! EvaluatioRightNowCell
            
            if historyAeri[indexPath.section].Today[indexPath.row].month ?? ""  == "1"{
                   
                cell.rightBayTodayLabel.text = ""
                cell.rightTodayLabel.text =  ""
             cell.rightthebackgroundView.layer.cornerRadius = 15
             cell.rightthebackgroundView.layer.borderWidth = 1.5
                 cell.rightthebackgroundView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                cell.rightBayTodayLabel.text = historyAeri[indexPath.section].Today[indexPath.row].month
                cell.rightTodayLabel.text =  historyAeri[indexPath.section].Today[indexPath.row].today
                cell.rightthebackgroundView.layer.cornerRadius = 15
                cell.rightthebackgroundView.layer.borderWidth = 1.5
                cell.rightthebackgroundView.layer.borderColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            }
            return cell
        }else{
        let cell = evaluationcollectionView.dequeueReusableCell(withReuseIdentifier: "EvaluatioDaysMonthCell", for: indexPath) as! EvaluatioDaysMonthCell
        if historyAeri[indexPath.section].Today[indexPath.row].month ?? ""  == "1"{
        cell.todaysDateLabel.text = ""
        cell.todaysLabel.text =  ""
        cell.backgroundview.layer.cornerRadius = 15
        cell.backgroundview.layer.borderWidth = 1.5
            cell.backgroundview.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
       }else{
        
   
   cell.todaysDateLabel.text = historyAeri[indexPath.section].Today[indexPath.row].month
   cell.todaysLabel.text =  historyAeri[indexPath.section].Today[indexPath.row].today
   cell.backgroundview.layer.cornerRadius = 15
   cell.backgroundview.layer.borderWidth = 1.5
       cell.backgroundview.layer.borderColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
       }
                        return cell
        }
      }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print( 1, historyAeri[indexPath.section].Today[indexPath.row].month!,TodayTime.Todaydaynumber().convertHindiDigits)
        
        print(2,tothrow(),historyAeri[indexPath.section].Today[indexPath.row].month!.convertHindiDigits)
        print(3,TodayTime.Todaydaynumber().convertHindiDigits)
        print(4,historyAeri[indexPath.section].Today[indexPath.row].month!)
    }
    
  
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 5

        }
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return  1
      }
   
}
