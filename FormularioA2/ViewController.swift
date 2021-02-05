//
//  ViewController.swift
//  FormularioA2
//
//  Created by mac13 on 29/01/21.
//  Copyright © 2021 UTT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tfNombreProd: UITextField!
    @IBOutlet var tfModeloProd: UITextField!
    @IBOutlet var tfCantidadProd: UITextField!
    @IBOutlet var tfPrecioProd: UITextField!
    @IBOutlet var swDisponibilidad: UISwitch!
    @IBOutlet var btnGuardar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnGuardar.layer.cornerRadius =
            self.btnGuardar.bounds.height / 2
    }


    @IBAction func guardarProducto(_ sender: UIButton) {
        let nombre:String = tfNombreProd.text!
        let modelo:String = tfModeloProd.text!
        let cantidad:Int = Int(tfCantidadProd.text!) ?? 0
        let precio:Double = Double(tfPrecioProd.text!) ?? 0.00
        
        if !nombre.isEmpty && !modelo.isEmpty {
            let producto = Producto(nombre:nombre, modelo: modelo, cantidad: cantidad, precio: precio, disponibilidad: swDisponibilidad.isOn)
            producto.store()
        }
    }
}

extension UIViewController{
    func alertDefault(withTitle title:String, whitMsg msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"OK", style: .default, handler: {
            (action) in alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

