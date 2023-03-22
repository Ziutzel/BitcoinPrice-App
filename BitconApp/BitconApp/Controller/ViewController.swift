//
//  ViewController.swift
//  BitconApp
//
//  Created by Ziutzel grajales on 21/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var tipoDeCambioPicker: UIPickerView!
    
    
    var tipoDeCambio = ["USD", "MXN", "EUR", "JPY","AUD","HKD","NZD","RUB","KRW" , "NOK"]
    
    var manager = BitcoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipoDeCambioPicker.delegate = self
        tipoDeCambioPicker.dataSource = self
        
        manager.actualizarPrecio(moneda: "\(tipoDeCambio[0])") { precio, error in
            if let bitcoin = precio {
                
                DispatchQueue.main.async {
                    
                    let precioFormato = String(format: "%.2f", bitcoin.rate)
                    self.precioLabel.text = "$ \(precioFormato)"
                }
            }
        }
    }


}

extension ViewController : UIPickerViewDelegate , UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return tipoDeCambio.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return tipoDeCambio[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        manager.actualizarPrecio(moneda: "\(tipoDeCambio[row])") { precio, error in
            if let bitcoin = precio {
                DispatchQueue.main.async {
                    let precioFormato = String(format: "%.2f", bitcoin.rate)
                    self.precioLabel.text = "$ \(precioFormato)"
                }
            }
        }
    }
}
