//
//  RegisterViewController.swift
//  ioslanjutan
//
//  Created by Nando Septian Husni on 3/27/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit
//TODO 4
import Alamofire
import SwiftyJSON

class RegisterViewController: UIViewController {

    @IBOutlet weak var inputconfirm: UITextField!
    @IBOutlet weak var inputpassword: UITextField!
    @IBOutlet weak var inputemail: UITextField!
    @IBOutlet weak var Inputname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerAction(_ sender: Any) {
        
        //TODO 1 check form kosong apa enggK
        if Inputname.text != "" && inputemail.text != "" && inputpassword.text != "" && inputconfirm.text != "" {
            
            //TODO 2 Check password dan confirmasi password sama atau tidak
            if inputpassword.text == inputconfirm.text {
                //TODO 3 eksekusi ke server
                
                //TODO 5 deklar parameter
                let params = ["name" : Inputname.text,
                              "password" : inputconfirm.text,
                              "alamat" : inputemail.text]
                
                //TODO 6 sent request to server
                Alamofire.request(Config.url + "register", method: .post, parameters: params as! [String : String], encoding: URLEncoding.httpBody, headers: nil)
                    .responseJSON(completionHandler: { (responseReg) in
                        
                        //TODO 7 eksekusi response
                        let json = JSON(responseReg.result.value as Any)
                        let pesan = json["pesan"].stringValue
                        let status = json["status"].boolValue
                        
                        //TODO 8 check response true/false
                        if(status){
                            //TODO 9 true pindah halman ke login
                            
                      let pindah  = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "login")
                            
                            self.show(pindah, sender: self)
                            
                            print(pesan)
                        }
                        else{
                            
                        }
                        
                    })
                
                
                
                
                
            }
            
            
            
            
        }
        
        
        
        
        
        
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
