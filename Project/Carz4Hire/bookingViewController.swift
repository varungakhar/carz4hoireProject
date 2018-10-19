  //
//  bookingViewController.swift
//  Carz4Hire
//
//  Created by user on 3/1/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import AFNetworking
  var placesClient: GMSPlacesClient!
class bookingViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,GMSAutocompleteViewControllerDelegate {
    @IBOutlet var driverTxt: UITextField!
    @IBOutlet var driverView: UIView!
    @IBOutlet var sideViewHome: UIView!
var getResultsArr = NSMutableArray()
    var connection = webservices()
    var strG = "";
        let validation:Validation = Validation.validationManager() as! Validation
    var message = String()
          var getDriverint = String()
    @IBOutlet var time2: UILabel!
  var result2 = NSArray()
    var dateFormatDate = NSDate()
    var dateFormatDate2 = NSDate()
    var getNames = String()
    var dateFormatterType = String()
    var dateFormatterType2 = String()
    var driverAge = "yes"
    @IBOutlet var tableView: UITableView!
    @IBOutlet var locationTxt: UITextField!
    @IBOutlet var switchBtnon: UISwitch!
    @IBOutlet var day2: UILabel!
    @IBOutlet var date2: UILabel!
    @IBOutlet var time1: UILabel!
    @IBOutlet var day1: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var viewline: UIView!
    @IBOutlet var createaccountbtn: UIButton!
    @IBOutlet var signinBtn: UIButton!
    @IBOutlet var logoutImg: UIImageView!
    @IBOutlet var logoutLbl: UILabel!
    @IBOutlet var logoutBtn: UIButton!
    @IBOutlet var pickupLocationView: UIView!
     var pickerView = UIDatePicker()
    var userData = UserDefaults()
       var toolBar = UIToolbar()
    var typePicker = String()
    var lati = CLLocationDegrees()
    var longi = CLLocationDegrees()
    let locationManager = CLLocationManager()
    var placesClient: GMSPlacesClient!
    var mapView = GMSMapView()
     var locationLat = NSDictionary()
    var dateFormat2 = String()
   var combineData = NSDictionary()
    var dateFormat = String( )
    var dateFormatTime = String()
      var dateFormatTime2 = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        tableView.delegate = self
        tableView.dataSource = self
           placesClient = GMSPlacesClient.shared()
             tableView.isHidden = true
        locationTxt.delegate = self
             //  placeAutoComplete()
         driverView.isHidden = true
               driverView.layer.cornerRadius = 5
        
        driverView.layer.borderColor = UIColor(red:0.15, green:0.22, blue:0.27, alpha:1.0).cgColor
        driverView.clipsToBounds = true
        driverView.layer.borderWidth = 1
        
        pickupLocationView.layer.cornerRadius = 5
        pickupLocationView.layer.borderColor = UIColor(red:0.15, green:0.22, blue:0.27, alpha:1.0).cgColor
        pickupLocationView.clipsToBounds = true
        pickupLocationView.layer.borderWidth = 1
        
//        dropoffLocationView.layer.cornerRadius = 5
//
//        dropoffLocationView.layer.borderColor = UIColor(red:0.15, green:0.22, blue:0.27, alpha:1.0).cgColor
//        dropoffLocationView.clipsToBounds = true
//        dropoffLocationView.layer.borderWidth = 1
        dateFormatDate = Calendar.current.date(byAdding: .hour, value: 2, to: Date()) as! NSDate
    let dates = Calendar.current.date(byAdding: .hour, value: 2, to: Date())
//        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        print(dates)
        
        let dateFormatter = DateFormatter()
          let dateFormatter2 = DateFormatter()
        let tempLocale = dateFormatter.locale
                let tempLocale2 = dateFormatter2.locale
        // save locale temporarily
//         dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
//        dateFormatter2.timeZone = NSTimeZone(name: "UTC")! as TimeZone
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter2.locale = Locale(identifier: "en_US_POSIX")
        // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
          dateFormatter2.dateFormat = "yyyy-MM-dd"
        let dateString5 = dateFormatter.string(from: dates!)
     //   let date = dateFormatter.date(from: dates as! String)!
        dateFormatter.dateFormat = "EEE | MMM"
              dateFormatter2.dateFormat = "dd"
        dateFormatter.locale = tempLocale // reset the locale
           dateFormatter2.locale = tempLocale2
        let dateString = dateFormatter.string(from: dates!)
            let dateString2 = dateFormatter2.string(from: dates!)
        print("EXACT_DATE : \(dateString)")
        
        let dateFormatter3 = DateFormatter()
        let dateFormatter4 = DateFormatter()
        let tempLocale3 = dateFormatter3.locale
        let tempLocale4 = dateFormatter4.locale
        // save locale temporarily
//        dateFormatter3.timeZone = NSTimeZone(name: "UTC")! as TimeZone
//        dateFormatter4.timeZone = NSTimeZone(name: "UTC")! as TimeZone
    
        
        

//        dateFormatter3.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter4.locale = Locale(identifier: "en_US_POSIX")
        // set locale to reliable US_POSIX
        dateFormatter3.dateFormat = "HH:mm"
        dateFormatter4.dateFormat = "HH:mm"
         let dateString6 = dateFormatter3.string(from: dates!)
        //   let date = dateFormatter.date(from: dates as! String)!
        dateFormatter3.dateFormat = "hh:mm a"
        dateFormatter4.dateFormat = "hh:mm a"
        dateFormatter3.locale = tempLocale3
        dateFormatter3.timeZone = NSTimeZone.local
         dateFormatter4.timeZone = NSTimeZone.local
           dateFormatter4.locale = tempLocale4 // reset the locale
        let dateString3 = dateFormatter3.string(from: dates!)
        let dateString4 = dateFormatter4.string(from: dates!)
        print("EXACT_DATE : \(dateString)")
   userData.set(dates, forKey: "minimumDate")
       
        //          dateFormatter.dateFormat = "dd/MM/yyyy"
             date.text = "\(dateString2)"
        date2.text = "\(dateString2)"
        time1.text = "Time:\(dateString3)"
        time2.text = "Time:\(dateString4)"
         dateFormat = "\(dateString5)"
        dateFormat2 = dateString5
        dateFormatTime  = dateString6
        dateFormatTime2  = dateString6
//        let today = Date()
//        let weekday = Calendar.current.component(.weekday, from: today)
//        let month = Calendar.current.component(.month, from: today)
//        let datess = Calendar.current.component(.day, from: today)
//
//        date.text = "\(datess)"
       day1.text = "\(dateString)"
            day2.text = "\(dateString)"
//
//        date2.text = "\(datess)"
//        day2.text = "\(Calendar.current.shortMonthSymbols[month-1]) \(datess)"
//        date.text = Calendar.current.weekdaySymbols[weekday-1]
//        day1.text = "\(Calendar.current.shortMonthSymbols[month-1]) \(datess)"
//
//        date2.text = Calendar.current.weekdaySymbols[weekday-1]
//        day2.text = "\(Calendar.current.shortMonthSymbols[month-1]) \(datess)"

        // Do any additional setup after loading the
    }
    func serverToLocal(date:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let localDate = dateFormatter.date(from: date)
        
        return localDate
    }
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    @IBAction func mybooking(_ sender: Any) {
        
        userData.removeObject(forKey: "getSeg")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "mybookings")
        self.navigationController?.pushViewController(vc!, animated: true)
       
    }
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return result2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "googleCell", for: indexPath) as! carz4hireTableViewCell
        let getName = (result2.object(at: indexPath.row) as AnyObject).value(forKey: "description")
        
        cell.location.text = getName as! String
        return cell
        
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        getNames = (result2.object(at: indexPath.row) as AnyObject).value(forKey: "place_id") as! String
//        let getNAmePlace = (result2.object(at: indexPath.row) as AnyObject).value(forKey: "description")
//        locationTxt.text! = getNAmePlace as! String
//         getLatLngForaddress()
//    }
    
    func UTCToLocal(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "hh:mm a"
        
        return dateFormatter.string(from: dt!)
    }
    @IBAction func searchBtnTap(_ sender: Any) {
      
   
//        let calendar = NSCalendar.current
//
//        // Replace the hour (time) of both dates with 00:00
//        let date111 = Calendar.current.date(byAdding: .hour, value: 2, to: Date()) as! NSDate
//
//        let date222 = dateFormatDate
//
//        print(date111)
//        print(date222)
//
//        let dateFormatter = DateFormatter()
////        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
////        dateFormatter.timeZone = NSTimeZone(name: "UTC") as! TimeZone
//        let datess = dateFormatDate // create   date from string
//        let datess2 = dateFormatDate2
////        // change to a readable time format and change to local time zone
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        dateFormatter.timeZone = NSTimeZone.local
//        let timeStamp = dateFormatter.string(from: datess as Date)
//        let timeStampD = dateFormatter.date(from: timeStamp)
//        // let timeStampD = dateFormatter.date(from: timeStamp as Date)
//
//
//        let timeStamp2 = dateFormatter.string(from: datess2 as Date)
//      let timeStampD2 = dateFormatter.date(from: timeStamp2)
//
////       // self.UTCToLocal(date: dateFormatTime)
////        let components = calendar.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date222 as Date)
////
//        let components2 = calendar.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date111 as Date)
////
//         let components3 = calendar.dateComponents([.minute], from: datess2 as Date)
//        print(components.hour)
//        print(components2.hour)
//
        
//       let components = calendar.dateComponents([.minute], from: date111, to: datess2)
        
//        let dtrrt = calendar.dateComponents([.minute], from: date111, to: datess2)
//        var date12 = Date()
//        var date22 = Date()
//        date12 = timeStampD2 as! Date
//        date22 = timeStampD as! Date
//        if date12 == date22
//        {
//            print("The two dates are the same")
//
//        }
//        else if date12 > date22
//        {
//            print("Date A is earlier than date B")
//        }
//        else if date12 < date22
//        {
//
//            message = "Invalid dates entered Please Check and Try Again."
//
//                                let alert = UIAlertController(title: "1 STOP CAR RENTALS", message: message, preferredStyle: UIAlertControllerStyle.alert)
//
//                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//
////                                pickerView.removeFromSuperview()
////
////                                toolBar.removeFromSuperview()
////
//                                self.present(alert, animated: true, completion: nil)
//
//        }
//        switch datess.compare(datess2 as Date) {
//
//        case .orderedAscending:
//            print("Date A is earlier than date B")
//        case .orderedSame:
//            print("Date A is later than date B")
//        case .orderedDescending:
//            print("The two dates are the same")
//        }
        
      
        if(driverAge ==  "no")
        {
            getDriverint = driverTxt.text!
        }
        else
        {
            getDriverint = "21"
        }
  if(locationTxt.text == "")
  {
    message = "Please enter a location"
    
    let alert = UIAlertController(title: "1 STOP CAR RENTALS", message: message, preferredStyle: UIAlertControllerStyle.alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    
    
    
    self.present(alert, animated: true, completion: nil)
        }
    
    
//        else if(components3.minute! < components2.minute!)
//        {
//          
//            message = "Please enter the 2 hours more than the current time"
//
//            let alert = UIAlertController(title: "1 STOP CAR RENTALS", message: message, preferredStyle: UIAlertControllerStyle.alert)
//
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//
//
//
//            self.present(alert, animated: true, completion: nil)
//            }


        
    
//  else if((components3.day! < components2.day!))
//  {
//    message = "Start date is less than end date"
//
//    let alert = UIAlertController(title: "1 STOP CAR RENTALS", message: message, preferredStyle: UIAlertControllerStyle.alert)
//
//    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//
//
//
//    self.present(alert, animated: true, completion: nil)
//  }
    
//   else if((components3.day! < components2.day!))
//    {
//        message = "Start date is less than end date"
//
//        let alert = UIAlertController(title: "1 STOP CAR RENTALS", message: message, preferredStyle: UIAlertControllerStyle.alert)
//
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//
//
//
//        self.present(alert, animated: true, completion: nil)
//    }
    
  
  

    
  else if (date.text == "Date" || date2.text == "Date")
  {
    message = "Enter both dates"
    
    let alert = UIAlertController(title: "1 STOP CAR RENTALS", message: message, preferredStyle: UIAlertControllerStyle.alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    
    
    
    self.present(alert, animated: true, completion: nil)
  }
  else if (time1.text == "Time" || time2.text == "Time")
  {
    message = "Please enter both times"
    
    let alert = UIAlertController(title: "1 STOP CAR RENTALS", message: message, preferredStyle: UIAlertControllerStyle.alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    
    
    
    self.present(alert, animated: true, completion: nil)
  }
    
    

    
     else  if(getDriverint == "")
        {
            
            if(driverAge ==  "no")
            {
            message = "Please enter the age of driver"
            
            let alert = UIAlertController(title: "1 STOP CAR RENTALS", message: message, preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            
            
            self.present(alert, animated: true, completion: nil)
        }
    
    }
        else
  {
    
    
    
    
   if(driverAge ==  "no")
   {
         getDriverint = driverTxt.text!
    }
    
        let getInt = Int(getDriverint)
        if(getInt! < 21 || getInt! > 70)
        {
            message = "No cars available: Age requirement not met"
            
            let alert = UIAlertController(title: "1 STOP CAR RENTALS", message: message, preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            
            
            self.present(alert, animated: true, completion: nil)
        }
    
        
    //    combineData = ["fromDate1":"2018-01-01" ,"fromtime1":"19:30","fromDate2":"2018-01-09","fromtime2":"21:34","latitude":self.locationLat.value(forKey: "lat")!,"longitude":self.locationLat.value(forKey: "lng")!,"type":"all","age":getDriverint]
    else
     {
    if(driverAge ==  "yes")
    {
        
        getDriverint = "21"
        
    }
        let latitide = self.locationLat.value(forKey: "lat")
        let lomgitude = self.locationLat.value(forKey: "lng")
        print(getDriverint)
          print(latitide)
          print(latitide)
    combineData = ["fromDate1":dateFormat ,"fromtime1":dateFormatTime,"fromDate2":dateFormat2,"fromtime2":dateFormatTime2,"latitude":latitide!,"longitude":lomgitude!,"type":"all","age":getDriverint,"location":locationTxt.text!]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "checkingViewController") as! checkingViewController
        
        vc.getDictData = combineData
        self.navigationController?.pushViewController(vc, animated: true)
        //self.present(vc, animated: true, completion: nil)
        }
    }
        
     
        
       
    }
    
    func getLatLngForaddress() {

        IJProgressView.shared.showProgressView(view: self.view)

        
        
        


        let string1 = "https://maps.googleapis.com/maps/api/place/details/json?placeid=\(getNames)&key=AIzaSyAbSssFTOk07W0HCgh8PNSwC5uiNZylXlM"

        let string22 = string1.addingPercentEscapes(using: String.Encoding.utf8)!

        let url = URL(string: string22)
        print(url)

        if url != nil{

            let request = NSMutableURLRequest(url: url!)

            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            let operation = AFHTTPRequestOperation(request: request as! URLRequest)
            operation.responseSerializer = AFJSONResponseSerializer()


            operation.setCompletionBlockWithSuccess({
                (AFHTTPRequestOperation, responseObject) -> Void in


          
                if let result = responseObject as? NSDictionary {

                    let result2:NSDictionary = (result.value(forKey: "result") as? NSDictionary)!
                        let geometry = result2.value(forKey: "geometry") as! NSDictionary
                        if let location = geometry.value(forKey: "location") as? NSDictionary {
                                                               let latitudeCor = location.value(forKey: "lat") as! CLLocationDegrees
                                                               let longitudeCor = location.value(forKey: "lng") as! CLLocationDegrees
                            
                                                            self.locationLat = ["lat":"\(latitudeCor)","lng":"\(longitudeCor)"]
                            print(self.locationLat)
                         IJProgressView.shared.hideProgressView()
                            self.tableView.isHidden = true

                    }
                }


          })
  

            operation.start()

        }
    }
    func getAddress(){
        
        print("lati",lati)
        
        print("longi",longi)
        
        IJProgressView.shared.showProgressView(view: self.view)
        
        var str = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(locationTxt.text!)&location=65.434343,65.23445&radius=500&language=en&key=AIzaSyAbSssFTOk07W0HCgh8PNSwC5uiNZylXlM"
        str = str.replacingOccurrences(of: " ", with: "%20")
        let string22 = str.addingPercentEscapes(using: String.Encoding.utf8)!

        print(str)
        let url = URL(string: string22)
        
        
        print(url!)
        
        let data = try? Data(contentsOf: url!)
        
        if data != nil {
            
            
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
            
            IJProgressView.shared.hideProgressView()
            if let result = json["predictions"] as? NSArray {
                
                 IJProgressView.shared.hideProgressView()
                print(result)
                
                if result.count != 0{
                    result2 = result
                    tableView.isHidden = false
                    tableView.delegate = self
                    tableView.dataSource = self
                    tableView.reloadData()
                
                    
                    
                    
                    //
                }
                
            }
            
            
            //                        if result.count == 0{
            //
            //                        self.alert.showAlert("Afrikk", subTitle: "No location found" , style: AlertStyle.Error)
            //                        }
        }
        //        }else{
        //
        //
        //            IJProgressView.shared.hideProgressView()
        //        }
        //
        //
        //
    }
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        
        print("sf,\(place.placeID)")
        
       getNames = "\(place.placeID)"
        locationTxt.text = "\(place.formattedAddress!)"
        getLatLngForaddress()
        dismiss(animated: true, completion: nil)
    }

    @IBAction func pickupLocationBtn(_ sender: Any) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        
        present(autocompleteController, animated: true, completion: nil)
    }
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//
//        if(locationTxt.text == "")
//        {
//            tableView.isHidden = true
//        }
//
//        else{
//
//                IJProgressView.shared.showProgressView(view: self.view)
//            getAddress()
//
//        }
//        return true
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//
//
//        if(locationTxt.text == "")
//        {
//            tableView.isHidden = true
//        }
//
//        else{
//                getAddress()
//
//        }
//
//
//    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
     //   placeAutoComplete()
        return true
    }
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        placeAutoComplete()
//        return true
//    }
    
//    func placeAutoComplete() {
//        let filter = GMSAutocompleteFilter()
//       // filter.type = .address
//
//        placesClient.autocompleteQuery("s",bounds: nil, filter: filter, callback: {(results, error) -> Void in
//            if let error = error {
//                print("Autocomplete error \(error)")
//                return
//            }
//            if let results = results {
//                for result in results {
//
//                    getResultsArr.add(result.attributedFullText)
//                    print("Result \(result.attributedFullText)")
//                }
//            }
//        })
//
//    }
    

    

    
    // Turn the network activity indicator on and off again.
   
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//        let location = locations.last
//
//        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
//
//     //   self.mapView.animate(to: camera)
//        //        marker.icon = UIImage(named: "radioOff")
//        //         self.marker.position =  CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude:(location?.coordinate.longitude)!)
//        //   marker.map = mapView
//
////        lati = (location?.coordinate.latitude)!
////        longi = (location?.coordinate.longitude)!
//
//        //Finally stop updating location otherwise it will come again and again in this delegate
//      //  self.locationManager.stopUpdatingLocation()
//
//    }
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse {
//
//            // 4
//            locationManager.startUpdatingLocation()
//
//            //5
//            mapView.isMyLocationEnabled = true
//            mapView.settings.myLocationButton = true
//        }
//    }
    @IBAction func myaccounttap(_ sender: Any) {
        
        if(!(userData.value(forKey: "emailSave") == nil))
        {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "myaccount")
            
        userData.removeObject(forKey: "getTypeSeg")
            
            self.navigationController?.pushViewController(vc!, animated: false)
        }
        else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "login")
            
            self.navigationController?.pushViewController(vc!, animated: false)
        }
    }

    func dropDownList(){
        
        pickerView.removeFromSuperview()
        
        toolBar.removeFromSuperview()
        //         toolBar.removeFromSuperview()
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            
            //            pickerView = UIDatePicker(frame: CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 300))
            
            pickerView = UIDatePicker(frame: CGRect(x: 0, y: self.view.frame.size.height - 300, width: self.view.frame.size.width, height: 300))
            
            
        }
        else
        {
            
            //            pickerView = UIDatePicker(frame: CGRectMake(0, self.view.frame.size.height - 150, self.view.frame.size.width, 150))
            pickerView = UIDatePicker(frame: CGRect(x: 0, y: self.view.frame.size.height - 150, width: self.view.frame.size.width, height: 150))
            
            
        }
        
        
        
        
   
        let gregorian: NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let currentDate: NSDate = NSDate()
        let components: NSDateComponents = NSDateComponents()
        
        

        
        //pickerView.addTarget(self, action: #selector(shiViewController.datePickerValueChanged(_:)), for: UIControlEvents.ValueChanged)
        
        pickerView.addTarget(self, action: #selector(bookingViewController .datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        
        
        //  pickerView.addTarget(self, action: Selector(("datePickerValueChanged(_:)")), for: UIControlEvents.valueChanged)
        pickerView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        //        toolBar = UIToolbar(frame: CGRectMake(0, self.pickerView.frame.origin.y - 30, self.view.frame.size.width, 30))
        
        toolBar = UIToolbar(frame: CGRect(x: 0, y: self.pickerView.frame.origin.y - 30, width: self.view.frame.size.width, height: 30))
        toolBar.barStyle = UIBarStyle.default
        
        toolBar.isTranslucent = true
        
        toolBar.tintColor = UIColor.blue
        
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action:#selector(bookingViewController.donePicker))
        
        //        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(JobRequestViewController.donePicker))
        
        doneButton.tintColor = UIColor.black
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action:#selector(bookingViewController.canclePicker))
        
        //        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(JobRequestViewController.canclePicker))
        //
        cancelButton.tintColor = UIColor.black
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        
        self.view.addSubview(pickerView)
        
        self.view.addSubview(toolBar)
//        self.pickerView.minimumDate =  Calendar.current.date(byAdding: .hour, value: 2, to: Date())
        if(typePicker == "time1" || typePicker == "time2" )
        {
//              self.pickerView.minimumDate =  Calendar.current.date(byAdding: .hour, value: 2, to: Date())
            
            pickerView.datePickerMode = .time
            
        }
        else{
            if(typePicker == "date1")
            {
             //   self.pickerView.minimumDate =  Calendar.current.date(byAdding: .hour, value: 2, to: Date())
            
            }
                
            else
            {
                if(!(userData.value(forKey: "minimumDate") == nil))
                {
                    self.pickerView.minimumDate = userData.value(forKey: "minimumDate") as? Date



                }

                else{


                   if (strG == "getS")
                   {
                    
                    
                    message = "Invalid dates entered Please Check and Try Again."

                    let alert = UIAlertController(title: "1 STOP CAR RENTALS", message: message, preferredStyle: UIAlertControllerStyle.alert)

                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))

                    pickerView.removeFromSuperview()

                    toolBar.removeFromSuperview()

                    self.present(alert, animated: true, completion: nil)
                }
                    else
                   {
               
                    
                    }
                    
                }
            }
            
            pickerView.datePickerMode = UIDatePickerMode.date
        }
        
    }
    func donePicker() {
        
        dateFormatterType = "\(dateFormatDate) \(dateFormatTime)"
        dateFormatterType2 = "\(dateFormatDate2) \(dateFormatTime2)"
        
        pickerView.removeFromSuperview()
        
        toolBar.removeFromSuperview()
        strG = "getS";
        
    }
    
    func canclePicker() {
        
        
        pickerView.removeFromSuperview()
        
        toolBar.removeFromSuperview()
        
        
    }
    
    
    func datePickerValueChanged(sender:UIDatePicker) {
        var dateG = Date()
        let dateFormatter = DateFormatter()
         dateFormatter.dateStyle = .medium
      let dateFormatter2 = DateFormatter()
        dateFormatter2.dateStyle = .medium
        let dateFormatter3 = DateFormatter()
        dateFormatter3.dateStyle = .medium
//          dateFormatter.dateFormat = "dd/MM/yyyy"
//        date.text = dateFormatter.string(from: sender.date)

       
        if(typePicker == "time1" || typePicker == "time2" )
        {
            
          dateFormatter.dateFormat = "hh:mm a"
//            let dateFormatter3 = dateFormatter
//
//
//            //                dateFormatter3.dateStyle = .medium
//            dateFormatTime = dateFormatter3.string(from: sender.date)
            
          
            if(typePicker == "time1")
                
            {
                
                dateFormatter3.dateFormat = "HH:mm"
                dateFormatTime = dateFormatter3.string(from: sender.date)
            time1.text = "Time:\(dateFormatter.string(from: sender.date))"
                
            }
                
            else
            {
                time2.text = "Time:\(dateFormatter.string(from: sender.date))"
                
                dateFormatter3.dateFormat = "HH:mm"
                
                dateFormatTime2 = dateFormatter3.string(from: sender.date)
               
                
            }
        }
        else{
         
       
    dateFormatter.dateFormat = "dd"
             dateFormatter2.dateFormat = "EEE | MMM"
            if(typePicker == "date1")
            {
                          dateFormatter3.dateFormat = "yyyy/MM/dd"
                        dateFormat = dateFormatter3.string(from: sender.date)
              dateFormatDate = sender.date as NSDate

                date.text = dateFormatter.string(from: sender.date)
                day1.text = dateFormatter2.string(from: sender.date)
                userData.set(sender.date, forKey: "minimumDate")
                //day1.text = dateFormatter.weekdaySymbols[Calendar.current.component(.weekday, from: sender.date)]
            }
            else
            {
                
                dateFormatter3.dateFormat = "yyyy/MM/dd"
                dateFormat2 = dateFormatter3.string(from: sender.date)
             
                date2.text = dateFormatter.string(from: sender.date)
                day2.text = dateFormatter2.string(from: sender.date)
                
               dateFormatDate2 = sender.date as NSDate
            }
         
        }
        
       dateFormatterType = "\(dateFormatDate) \(dateFormatTime)"
         dateFormatterType2 = "\(dateFormatDate2) \(dateFormatTime2)"
        
       // weekday
       // dobTxt.text = dateFormatter.string(from: sender.date)
        
        
        
    }

    @IBAction func timeBtnTap(_ sender: Any) {
        typePicker = "time1"
        
        pickerView.removeFromSuperview()
        
        toolBar.removeFromSuperview()
        
        dropDownList()
        
    }
    @IBAction func timeBtnTap2(_ sender: Any) {
         typePicker = "time2"
        
        pickerView.removeFromSuperview()
        
        toolBar.removeFromSuperview()
        
        dropDownList()
    }
    @IBAction func dateBtnTap(_ sender: Any) {
        
       
         typePicker = "date1"
        pickerView.removeFromSuperview()
        
        toolBar.removeFromSuperview()
        
        dropDownList()

    }
    
    @IBAction func datebtntap2(_ sender: Any) {
         typePicker = "date2"
        
        pickerView.removeFromSuperview()
        
        toolBar.removeFromSuperview()
        
        dropDownList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if(!(userData.value(forKey: "emailSave") == nil))
        {
            viewline.isHidden =  true
            createaccountbtn.isHidden =  true
            signinBtn.isHidden = true
            logoutImg.isHidden = false
            logoutLbl.isHidden = false
            logoutBtn.isHidden = false
         
            
        }
        else{
            viewline.isHidden = false
            createaccountbtn.isHidden = false
            signinBtn.isHidden = false
            logoutImg.isHidden = true
            logoutLbl.isHidden = true
            logoutBtn.isHidden = true
            
        }

    }

    
    @IBAction func switchBtnTap(_ sender: UISwitch) {
        
        if(switchBtnon.isOn)
        {
            driverView.isHidden = true
            
            driverAge = "yes"
        }
        
        else
        {
            
            driverView.isHidden = false
            
            driverAge = "no"
            
        }
    }
    @IBOutlet var dropoffLocationView: UIView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func btntt(_ sender: Any) {
        
        var basketTopFrame: CGRect = sideViewHome.frame
        basketTopFrame.origin.x = -950
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {() -> Void in
            self.sideViewHome.frame = basketTopFrame
        }, completion: {(_ finished: Bool) -> Void in
            self.sideViewHome.isHidden = true;
        })

    }
    override func viewWillDisappear(_ animated: Bool) {
        userData.removeObject(forKey: "minimumDate")
    }
    @IBAction func logoutBtnTap(_ sender: Any) {
            self.userData.set("havenot", forKey: "licence")
        userData.removeObject(forKey: "emailSave")
         userData.removeObject(forKey: "emailSave")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "login")
        
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    @IBAction func menuBtn(_ sender: Any) {
        
        self.sideViewHome.isHidden = false;
        
        var napkinBottomFrame: CGRect = sideViewHome.frame
        napkinBottomFrame.origin.x = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {() -> Void in
            self.sideViewHome.frame = napkinBottomFrame
        }, completion: {(_ finished: Bool) -> Void in
            /*done*/
            
        })

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
