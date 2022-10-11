//
//  ViewController.swift
//  WeatherApp
//
//  Created by Berkay Ozcan on 30/09/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    
    @IBOutlet weak var button: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 10
    }

    override func viewWillAppear(_ animated: Bool) {
        text.text = ""
    }
    
    @IBAction func button(_ sender: Any) {
        
        let cityText = text.text ?? ""
        
        if cityText.isEmpty == true {
            alert(title: "Error", message: "Lutfen Sehir Giriniz")
        }else{
            let destinationVC = storyboard?.instantiateViewController(withIdentifier: "detailVc") as! DetailViewController
            destinationVC.secilenSehir = cityText
            navigationController?.pushViewController(destinationVC, animated: true)
            
        }
        
    }

    func alert(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    
}

