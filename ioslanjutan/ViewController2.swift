//
//  ViewController2.swift
//  ioslanjutan
//
//  Created by Nando Septian Husni on 3/26/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController2: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    
    
    @IBOutlet weak var t: UITableView!
    var arraynya = [[String : Any]]()
    
    var hasilpindah: String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        t.delegate = self
        t.dataSource = self
        
        Alamofire.request("http://192.168.20.141/server_restoran/index.php/Server/getMakanan")
            .responseJSON { (responseRestoran) in
                
                
                //check
                responseRestoran.result.ifSuccess {
                    
                    //ambil
                    let all = JSON(responseRestoran.result.value as Any)
                    //array
                    self.arraynya = all["datanya"].arrayObject as! [[String : Any]]
                    
                    print(self.arraynya)
                    
                    self.t.reloadData()
                }
        }

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraynya.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.name.text = arraynya[indexPath.row]["makanan_nama"] as? String
        cell.harga.text = arraynya[indexPath.row]["makanan_harga"] as? String
        
        return cell
        
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
