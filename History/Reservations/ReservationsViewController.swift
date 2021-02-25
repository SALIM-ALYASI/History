//
//  ReservationsViewController.swift
//  History
//
//  Created by ALYASI on 21/02/2021.
//

extension String{
    var localized:String{
        return NSLocalizedString(self, comment: "")
    }
}
import UIKit

class ReservationsViewController: UIViewController {
    var actionDefault: (()->Void)?
    var id:Int?
    var userID:Int?
    
    //
//    Today
    var Today = [String]()
     var evaluation =  [Evaluation]()
   var monthName = ""
     var monthNumber = [Months]()
     var years = Int( ReservationsTime.Years().convertHindiDigits)
     @IBOutlet weak var evaluationcollectionView: UICollectionView!
    var timerTest = Timer()
     var time = 0
    var reservations :Date?
    override func viewDidLoad() {
         super.viewDidLoad()
        monthName =   ReservationsTime.TodayNumbers ()
        Reservations()
        title =   ReservationsTime.dateNow()
        evaluationcollectionView.showsHorizontalScrollIndicator = false
         evaluationcollectionView.showsVerticalScrollIndicator = false

    }
  
 


    var Reser:Int?
     
    func Reservations() {
        print(6,ReservationsTime.TodayByNumbers () ,ReservationsTime.Years())
      
        let month = MatrixTheMonths.Today()
        let day = month.replacingOccurrences(of: ",", with: "")
        
        switch  day.localized {
        case "Saturday".localized:
            print(4,month)
           evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(contentsOf:MatrixTheMonths.EvaluationData( swift: ReservationsTime.TodayByNumbers (),Year: ReservationsTime.Years()) )
            self.evaluationcollectionView.reloadData()
        case "Monday".localized:
            print(1,month)
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(contentsOf:MatrixTheMonths.EvaluationData( swift: ReservationsTime.TodayByNumbers (),Year: ReservationsTime.Years()) )
            self.evaluationcollectionView.reloadData()
        case "Tuesday".localized:
            print(2,month)
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(contentsOf:MatrixTheMonths.EvaluationData( swift: ReservationsTime.TodayByNumbers (),Year: ReservationsTime.Years()) )
            self.evaluationcollectionView.reloadData()
        case "Wednesday".localized:
            print(3,month)
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            Reser = 3
            evaluation.append(contentsOf:MatrixTheMonths.EvaluationData( swift: ReservationsTime.TodayByNumbers (),Year: ReservationsTime.Years()) )
            self.evaluationcollectionView.reloadData()
        case "Thursday".localized:
            print(4,month)
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            Reser = 4
            evaluation.append(contentsOf:MatrixTheMonths.EvaluationData( swift: ReservationsTime.TodayByNumbers (),Year: ReservationsTime.Years()) )
            self.evaluationcollectionView.reloadData()
        case "Friday".localized:
            print(5,month)
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            evaluation.append(Evaluation.init(month:  "0", today: "0", number: "0",year:"0"))
            Reser = 5
            evaluation.append(contentsOf:MatrixTheMonths.EvaluationData( swift: ReservationsTime.TodayByNumbers (),Year: ReservationsTime.Years()) )
            self.evaluationcollectionView.reloadData()
        case "Sunday".localized:
            print(0,month)
            evaluation.append(contentsOf:MatrixTheMonths.EvaluationData( swift: ReservationsTime.TodayByNumbers (),Year: ReservationsTime.Years()) )
            self.evaluationcollectionView.reloadData()
        default:
            break
        }
       
    }
    

 
 }
extension ReservationsViewController:UICollectionViewDelegate, UICollectionViewDataSource  ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return evaluation.count
     }
     
  
 
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if evaluation[indexPath.row].month !=  ReservationsTime.Todaydaynumber() {
        
         let cell = evaluationcollectionView.dequeueReusableCell(withReuseIdentifier: "ReservationsCell", for: indexPath) as! ReservationsCell
        if evaluation[indexPath.row].today ==  "0" {
            
         cell.rightBayTodayLabel.text = ""
         cell.rightTodayLabel.text =  ""
            cell.rightthebackgroundView.layer.cornerRadius = 10
            cell.rightthebackgroundView.layer.borderWidth = 1.5
            cell.rightthebackgroundView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }else{
        cell.rightBayTodayLabel.text = evaluation[indexPath.row].number
         // cell.rightTodayLabel.text = indexPathint[indexPath.row].Reservation
        cell.rightthebackgroundView.layer.cornerRadius = 10
        cell.rightthebackgroundView.layer.borderWidth = 1.5
        cell.rightthebackgroundView.layer.borderColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }
             return cell
        
     }else{
      //  print(ReservationsTime.Todaydaynumber(),2)
         let cell = evaluationcollectionView.dequeueReusableCell(withReuseIdentifier: "TodayCell", for: indexPath) as! TodayCell
        cell.rightBayTodayLabel.text = evaluation[indexPath.row].number
         cell.rightTodayLabel.text = ReservationsTime.Todayday()
                         return cell
         }
       }
   
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: evaluationcollectionView.frame .width / 8 , height: self.evaluationcollectionView.frame .height / 8)
     }
     func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
         return CGSize(width: collectionView.frame.size.width/5, height: collectionView.frame.size.height/7)
     }
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
      return 2

        }
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return 2
      }
   
    
 }
