//
//  ViewController.swift
//  ioslanjutan
//
//  Created by Nando Septian Husni on 3/26/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit
//todo 2 tambhin module
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var inputname: UITextField!
    
    @IBOutlet weak var inputrestoran: UITextField!
    @IBOutlet weak var inputharga: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("didload")
        
        //check session
      
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func acrionaccount(_ sender: Any) {
        
        let session = UserDefaults.standard
        
        
        let alert = UIAlertController(title: "Profil",
                                      message:
            "Name : " + session.string(forKey: Config.name)! + "\n" +
                "Alamat : " + session.string(forKey: Config.alamat)! ,
                                      
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        let actionSignOut = UIAlertAction(title: "Sign Out", style: UIAlertActionStyle.default) { (action) in
            
            //action logout
            session.set(false, forKey: Config.status)
            
            //nyimpan perubahan
            session.synchronize()
            
            //arahkan ke login
            self.viewDidAppear(true)
        }
        
        let actioncncel = UIAlertAction(title: "cancel", style: .default) { (cancel) in
            cancel.isEnabled = false
        }
        
        alert.addAction(actioncncel)
        
        
        alert.addAction(actionSignOut)
        
        present(alert, animated: true, completion: nil)
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        if (!UserDefaults.standard.bool(forKey: "udahlogin")){
            
            let pindah  = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "login")
            
            self.show(pindah, sender: self)
            
        }
            
        else{
            print("error")
        }
    }

    @IBAction func tambah(_ sender: Any) {
        
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
      let pindah =   story.instantiateViewController(withIdentifier: "dua") as! ViewController2
        
        pindah.hasilpindah = "hei"
        
        show(pindah, sender: self)
        
        
        //check inputan user kita pastikan semua textfield ke isi semua
//
//        if inputname.text != "" && inputrestoran.text != "" && inputharga.text != "" {
//
//            //deklrasi variable berdasarkan web server
//            let params = ["name" : inputname.text,
//                          "price" : inputharga.text,
//                          "restoran" : inputrestoran.text
//            ]
//
//            //deklar request ke web server
//            Alamofire.request("http://192.168.20.141/server_restoran/index.php/Server/insertMakanan", method: .post, parameters: params as! [String : String] , encoding: URLEncoding.httpBody, headers: nil).responseJSON(completionHandler: { (responseinsert) in
//
//                //check response
//                responseinsert.result.ifSuccess {
//                    //ambil jaoson
//                    //{"pesan":"bang,berhasil ya","status":1}
//                    let alljson = JSON(responseinsert.result.value as Any)
//
//                    let message = alljson["pesan"].stringValue
//                    let status = alljson["status"].intValue
//
//                    if status == 1 {
//
//                        print("insert berhasil")
//                        print(message)
//
//                    }
//                    else{
//                        print("error")
//                    }
//
//
//
//
//
//                }
//
//
//
//
//            })
//
//
//
//
//        }
//        else {
//
//            //pop up kalau textfield ada yang kosong
//            let alert = UIAlertController(title: "information", message: "tidak boleh kosong ya", preferredStyle: UIAlertControllerStyle.alert)
//
//            //nambahin action dari alery
//            let action1 = UIAlertAction(title: "oke", style: UIAlertActionStyle.cancel, handler: { (action) in
//
//
//                print("ini klik action1")
//
//            })
//            //include action to alert
//            alert.addAction(action1)
//            //menampilkan alert
//            present(alert, animated: true, completion: nil)
//
//
//
//
//
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

