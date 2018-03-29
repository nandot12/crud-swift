//
//  LoginViewController.swift
//  ioslanjutan
//
//  Created by Nando Septian Husni on 3/27/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var inputpassword: UITextField!
    @IBOutlet weak var inputname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionlogin(_ sender: Any) {
        
        let params = ["name" : inputname.text,
                      "password" : inputpassword.text,
                      ]
        
        //TODO 6 sent request to server
        Alamofire.request(Config.url + "login", method: .post, parameters: params as! [String : String], encoding:URLEncoding.httpBody, headers: nil)
            .responseJSON(completionHandler: { (responseReg) in
                
                //TODO 7 eksekusi response
                let json = JSON(responseReg.result.value as Any)
                let pesan = json["pesan"].stringValue
                let status = json["status"].boolValue
                
                let datauser = json["data"].dictionaryValue
                
                let name = datauser["user_nama"]?.stringValue
                let alamat = datauser["user_alamat"]?.stringValue
                
                if(status){
                    
                    print("login success")
                    //deklar dari user default untuk simpan session
                    let session = UserDefaults.standard
                    
                    session.setValue(name, forKey: Config.name)
                    session.setValue(alamat, forKey: Config.alamat)
                    session.setValue(true, forKey: Config.status)
                    
                    session.synchronize()
                    
                    
                    let pindah  = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "main")
                    
                    self.show(pindah, sender: self)
                    
                    
                    
                    
                    
                }
                
                else{
                    print("login er")
                }
                
                //TODO 8 check response true/false
//                if(status){
//                    //TODO 9 true pindah halman ke login
//
//                    let pindah  = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "login")
//
//                    self.show(pindah, sender: self)
//
//                    print(pesan)
//                }
//                else{
//
//                }
//
         })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
