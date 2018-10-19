//
//  hotoffersViewController.swift
//  Carz4Hire
//
//  Created by user on 3/9/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class hotoffersViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var getcarsArr = NSArray()
    
    var getDataDict1 = NSDictionary()
    var getTypeDeals = String()
    var carInfoget2 = NSMutableArray()
    var carInfoget3 = NSArray()
    var connection = webservices()
    let validation:Validation = Validation.validationManager() as! Validation
    var message = String()
    var getDatesArr = NSMutableArray()
    var userData = UserDefaults()
    var getDays = NSMutableArray()
    var getValuesArr = NSMutableArray()
    var stringSeven = String()
    var monInt = Int()
    var tueInt = Int()
    var wedInt = Int()
    var thuInt = Int()
    var friInt = Int()
    var satInt = Int()
    var sunInt = Int()
    var bb = NSDictionary()
    @IBOutlet var tableView: UITableView!
    @IBOutlet var loginView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(!(userData.value(forKey: "emailSave") == nil))
        {
            tableView.delegate = self
            tableView.dataSource = self
            loginView.isHidden = true
            searchCars()
        }
        else
        {
            
            loginView.isHidden = false
        }
        
        // Do any additional setup after loading the view.
    }
//    @IBAction func backBtnTap(_ sender: Any) {
//
//        self.navigationController?.popViewController(animated: false)
//    }
    
    override func viewWillAppear(_ animated: Bool) {
    

    }
    
    func searchCars(){
        
        
        
        IJProgressView.shared.showProgressView(view: self.view)
        
        // param ["user_email"]  = emailUser.text! as NSObject
        
      
        
        connection.startConnectionWithStringGetType2(getUrlString: "gethotoffers", outputBlock: { (receivedData) in
      
            if (self.connection.responseCode == 1){
                
                print(receivedData)
                
                if(((receivedData.value(forKey: "message") != nil)))
                {
                    if(receivedData.value(forKey: "message") as! String == "success")
                    {
                        
                        IJProgressView.shared.hideProgressView()
                        
                        let getDataDict = receivedData.value(forKey: "data") as! NSDictionary
                        
                        self.getcarsArr = getDataDict.value(forKey: "data") as! NSArray
                        self.bb = receivedData.value(forKey: "data") as! NSDictionary
                        self.carInfoget2 = self.getcarsArr.mutableCopy() as! NSMutableArray
                        self.tableView.delegate = self
                        self.tableView.dataSource = self
                        self.tableView.reloadData()
                        //                        let getLatitudes = getDataArr.value(forKey: "latitude") as! NSArray
                        //
                        //                        let getLongitude = getDataArr.value(forKey: "longitude") as! NSArray
                        //
                        //
                        //
                        //                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "location") as! locationViewController
                        //
                        //                        vc.latitudeArr = getLatitudes
                        //
                        //                        vc.longitudeArr = getLongitude
                        //
                        //                        self.navigationController?.pushViewController(vc, animated: true)
                        
                        
                        
                        
                    }
                        
                        
                    else{
                        
                        
                        
                        
                        
                        //  print(message)
                        
                        self.message = receivedData.value(forKey: "message") as! String
                        
                        
                        print(receivedData)
                        
                        
                        
                        let alertController = UIAlertController(title: "1 STOP CAR RENTALS", message: self.message, preferredStyle: .alert)
                        
                        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                            UIAlertAction in
                            
                            IJProgressView.shared.hideProgressView()
                            
                        }
                        
                        
                        alertController.addAction(okAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                    }
                    
                    
                }
                    
                    
                    //                    if((receivedData.value(forKey: "status") as! Int) == 0){
                    //
                    //
                    //                    }
                else{
                    
                    
                    
                    
                    
                    //  print(message)
                    
                    _ =   receivedData.value(forKey: "error")
                    
                    
                    let message:String  = (receivedData.value(forKey: "errors") as AnyObject).value(forKey:"error") as! String
                    
                    
                    self.message = message
                    
                    
                    
                    self.message = message
                    
                    let alertController = UIAlertController(title: "1 STOP CAR RENTALS", message: self.message, preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                        UIAlertAction in
                        
                        IJProgressView.shared.hideProgressView()
                        
                    }
                    
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
                
                
            }
            else{
                
                print(receivedData)
                
                
                let alertController = UIAlertController(title: "1 STOP CAR RENTALS", message: "Connection Error", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Reload", style: UIAlertActionStyle.default) {
                    UIAlertAction in
                    
                    IJProgressView.shared.hideProgressView()
                    
                    self.searchCars()
                    
                    
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
                    UIAlertAction in
                    
                    IJProgressView.shared.hideProgressView()
                }
                
                alertController.addAction(okAction)
                alertController.addAction(cancelAction)
                
                
                self.present(alertController, animated: true, completion: nil)
            }
            
        })
        
        
    }
    
    func searchCars2(){
        
        
        
        IJProgressView.shared.showProgressView(view: self.view)
        
        // param ["user_email"]  = emailUser.text! as NSObject
        
        let nextUrl = bb.value(forKey: "next_page_url") as! String
        var newUrl = nextUrl.components(separatedBy: "?")
      
        connection.startConnectionWithStringGetType2(getUrlString: "gethotoffers?\(newUrl[1])" as NSString, outputBlock: { (receivedData) in
            
            if (self.connection.responseCode == 1){
                
                print(receivedData)
                
                if(((receivedData.value(forKey: "message") != nil)))
                {
                    if(receivedData.value(forKey: "message") as! String == "success")
                    {
                        
                        IJProgressView.shared.hideProgressView()
                        
                        let getDataDict = receivedData.value(forKey: "data") as! NSDictionary
                        self.bb  = receivedData.value(forKey: "data") as! NSDictionary
                        
                        self.carInfoget3 = getDataDict.value(forKey: "data") as! NSArray
                        self.carInfoget2.addObjects(from: self.carInfoget3 as! [Any])
                        self.tableView.delegate = self
                        self.tableView.dataSource = self
                        self.tableView.reloadData()
                        //                        let getLatitudes = getDataArr.value(forKey: "latitude") as! NSArray
                        //
                        //                        let getLongitude = getDataArr.value(forKey: "longitude") as! NSArray
                        //
                        //
                        //
                        //                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "location") as! locationViewController
                        //
                        //                        vc.latitudeArr = getLatitudes
                        //
                        //                        vc.longitudeArr = getLongitude
                        //
                        //                        self.navigationController?.pushViewController(vc, animated: true)
                        
                        
                        
                        
                    }
                        
                        
                    else{
                        
                        
                        
                        
                        
                        //  print(message)
                        
                        self.message = receivedData.value(forKey: "message") as! String
                        
                        
                        print(receivedData)
                        
                        
                        
                        let alertController = UIAlertController(title: "1 STOP CAR RENTALS", message: self.message, preferredStyle: .alert)
                        
                        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                            UIAlertAction in
                            
                            IJProgressView.shared.hideProgressView()
                            
                        }
                        
                        
                        alertController.addAction(okAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                    }
                    
                    
                }
                    
                    
                    //                    if((receivedData.value(forKey: "status") as! Int) == 0){
                    //
                    //
                    //                    }
                else{
                    
                    
                    
                    
                    
                    //  print(message)
                    
                    _ =   receivedData.value(forKey: "error")
                    
                    
                    let message:String  = (receivedData.value(forKey: "errors") as AnyObject).value(forKey:"error") as! String
                    
                    
                    self.message = message
                    
                    
                    
                    self.message = message
                    
                    let alertController = UIAlertController(title: "1 STOP CAR RENTALS", message: self.message, preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                        UIAlertAction in
                        
                        IJProgressView.shared.hideProgressView()
                        
                    }
                    
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
                
                
            }
            else{
                
                print(receivedData)
                
                
                let alertController = UIAlertController(title: "1 STOP CAR RENTALS", message: "Connection Error", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Reload", style: UIAlertActionStyle.default) {
                    UIAlertAction in
                    
                    IJProgressView.shared.hideProgressView()
                    
                    self.searchCars()
                    
                    
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
                    UIAlertAction in
                    
                    IJProgressView.shared.hideProgressView()
                }
                
                alertController.addAction(okAction)
                alertController.addAction(cancelAction)
                
                
                self.present(alertController, animated: true, completion: nil)
            }
            
        })
        
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if(tableView == tableView)
        {
            if(carInfoget2.count - 1 == indexPath.row){
                
                let nextUrl = bb.value(forKey: "next_page_url")
                print("nexturl",nextUrl)
                if(nextUrl is NSNull){
                    
                }
                    
                else{
                    
                    //                incrementPages = incrementPages + 1
                    
                    searchCars2()
                    
                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carInfoget2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let getType = carInfoget2.object(at: indexPath.row) as! NSDictionary
  
       
    //    carInfoget2.removeAllObjects()
        getValuesArr = []
        let getcarType = getType.value(forKey:"car_type") as! String
        if(getcarType == "Chauffeur")
        {
            //tableView.rowHeight = 248
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellhot2", for: indexPath) as! carz4hireTableViewCell
            cell.cartitlename.text = (getType.value(forKey:"cartitle") as! String)
            let getcartypes = getType.value(forKey:"car_type") as? String
            let getc = getcartypes?.uppercased()
            cell.economy.text = getc
    cell.payment.text = getType.value(forKey:"payment_type") as! String
            cell.locationlist.text = getType.value(forKey:"location") as? String
//            let getvalidtodate = getType.value(forKey:"validto")  as! String
//            let getvalidfromdate = getType.value(forKey:"validfrom")  as! String
//            let date1 = getvalidtodate.toDateTime1()
//            let date2 = getvalidfromdate.toDateTime1()
//            cell.validDate.text = "\(date1)-\(date2)"
            print("getDays.count",getDays.count)

            cell.moneyCar.text = "From £99"
            let getcompanyLogo =  getType.value(forKey:"company_logo")  as! String
            let stringAppend = "http://carz4hire.com/companylogo/"

            let imageCompany = "\(stringAppend)\(getcompanyLogo)"
            let fileUrl = NSURL(string: imageCompany)
            cell.companyLogo.setImageWith(fileUrl as! URL)
 if(!(getType.value(forKey:"default_car") is NSNull))
 {

            let getcarLogo =  getType.value(forKey:"default_car")  as! String
            let stringAppend2 = "http://carz4hire.com/carimages/"

            let imagecar = "\(stringAppend2)\(getcarLogo)"
            let fileUrl1 = NSURL(string: imagecar)
            print("fileUrl1",fileUrl1)
            cell.carImage.setImageWith(fileUrl1! as URL)
            }

            //             cell.driver.text = getData.value(forKey:"driver_uniform") as! String

            return cell
        }
        else
        {
            let getData = getType.value(forKey: "hot_offer") as! NSDictionary
            tableView.rowHeight = 146
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellhot", for: indexPath) as! carz4hireTableViewCell
            cell.cartitlename.text = getType.value(forKey:"cartitle") as! String
            let getcartypes = getType.value(forKey:"car_type") as? String
            let getvalidtodate = getData.value(forKey:"validto")  as! String
                  let getvalidfromdate = getData.value(forKey:"validfrom")  as! String
            let date1 = getvalidtodate.toDateTime1()
            let date2 = getvalidfromdate.toDateTime1()
                  cell.validDate.text = "\(date2)-\(date1)"
            let getc = getcartypes?.uppercased()
            cell.economy.text = getc
          cell.age.text =  "\(getType.value(forKey:"driver_age")!)+"
            cell.locationlist.text = getType.value(forKey:"location") as! String
            cell.payment.text = getType.value(forKey:"payment_type") as! String

            print("getDays.count",getDays.count)

let getcompanyCost =  getData.value(forKey:"companycharges")  as! Int
            cell.moneyCar.text = "£\(getcompanyCost)"
            let getcompanyLogo =  getType.value(forKey:"company_logo")  as! String
            let stringAppend = "http://carz4hire.com/companylogo/"

            let imageCompany = "\(stringAppend)\(getcompanyLogo)"
            let fileUrl = NSURL(string: imageCompany)
            cell.companyLogo.setImageWith(fileUrl as! URL)
 if(!(getType.value(forKey:"default_car") is NSNull))
 {
            let getcarLogo =  getType.value(forKey:"default_car")  as! String
            let stringAppend2 = "http://carz4hire.com/carimages/"

            let imagecar = "\(stringAppend2)\(getcarLogo)"
            let fileUrl1 = NSURL(string: imagecar)
            print("fileUrl1",fileUrl1)
            cell.carImage.setImageWith(fileUrl1! as URL)
    
            }
            return cell
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "hot") as! hotofferdata2ViewController
          let getType = carInfoget2.object(at: indexPath.row) as! NSDictionary
        
//        let getData = getcarsArr.object(at: indexPath.row) as! NSDictionary
        let idget = (getType.value(forKey:"id") as! Int)

        let getReservation = getType.value(forKey:"reservation_charges") as? Int
   
        let getcartypes = getType.value(forKey:"car_type") as? String
     
        userData.set(idget, forKey: "idget")
        var getcompanyCost = Int()
        var getbookingCost = Int()
            if(getcartypes == "Chauffeur")
            {
                userData.set("", forKey: "getValidTo")
                userData.set("", forKey: "getValidFrom")
                 getcompanyCost =  getType.value(forKey:"company_charges")  as! Int
                 getbookingCost =  getType.value(forKey:"booking_charges")  as! Int
        }
        else
            {
            
                let getData = getType.value(forKey: "hot_offer") as! NSDictionary
                 getcompanyCost =  getData.value(forKey:"companycharges")  as! Int
                
                let getB = getData.value(forKey:"bookingcharges")  as! Int
                getbookingCost =  getReservation! + getB
                let getvalidtodate = getData.value(forKey:"validto")  as! String
                let getvalidfromdate = getData.value(forKey:"validfrom")  as! String
                userData.set(getvalidtodate, forKey: "getValidTo")
                userData.set(getvalidfromdate, forKey: "getValidFrom")

        }
      //  let getFinal = getcompanyCost + getbookingCost
        userData.set(getcompanyCost, forKey: "getcompanyCost")
        userData.set(getbookingCost, forKey: "bookCharges")

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "hotoffersCell", for: indexPath)
//
//        return cell
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
////        let vc = storyboard?.instantiateViewController(withIdentifier: "carsCheck")
////
////        self.navigationController?.pushViewController(vc!, animated: true)
//    }
//
    

 
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
