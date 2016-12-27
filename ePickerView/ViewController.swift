//
//  ViewController.swift
//  ePickerView
//
//  Created by Na Wu on 2016-12-26.
//  Copyright © 2016 Na Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var poutine = Poutine()
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Set background image
        let strURL = "https://scontent-yyz1-1.cdninstagram.com/t51.2885-15/e35/12976493_597699037064606_1193694710_n.jpg"
        let url = URL(string: strURL)
        let data = try? Data(contentsOf: url!)
        imageView.image = UIImage(data: data!)
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.3
        
        // Set Picker
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return poutine.columns()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return poutine.numberOfType()
        case 1:
            return poutine.numberOfSize()
        default:
            return 0
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let lable = UILabel()
        
        lable.textColor = .black
        lable.font = UIFont(name: "SanFranciscoText-Light", size: 18)
        
        switch component {
        case 0:
            lable.textAlignment = .left
            lable.text = poutine.getPoutineType(index: row)
        case 1:
            lable.textAlignment = .right
            lable.text = poutine.getPoutineSize(index: row)
        default:
            lable.text = "Error"
        }
        
        return lable
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        poutine.setOrder(type: component, indexValue: row)
    }
    
    @IBAction func submitOrder(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "You ordered", message: "", preferredStyle: .alert)
        alertController.message = poutine.orderedPoutine["Type"]! + ", " + poutine.orderedPoutine["Size"]! + ". Enjoy! Thank you!"
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }

}

