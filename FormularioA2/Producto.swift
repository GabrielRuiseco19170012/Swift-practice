//
//  Producto.swift
//  FormularioA2
//
//  Created by mac13 on 29/01/21.
//  Copyright © 2021 UTT. All rights reserved.
//

import UIKit

class Producto: Codable {
    var nombre:String
    var modelo:String
    var cantidad:Int
    var precio:Double
    var disponibilidad:Bool
    
    init(nombre:String, modelo:String, cantidad:Int, precio:Double, disponibilidad:Bool) {
        self.nombre = nombre
        self.modelo = modelo
        self.cantidad = cantidad
        self.precio = precio
        self.disponibilidad = disponibilidad
    }
    
    func store(vc:UIViewController){
        //getProducts
        App.shared.productos = self.getProducts()
        App.shared.productos.append(self)
        
        do{
            let encoder = JSONEncoder()
            let data = try encoder.encode(App.shared.productos)
            App.shared.defaults.setValue(data, forKey: "productos")
            App.shared.defaults.synchronize()
            vc.alertDefault(withTitle: "El producto se guardo", whitMsg: "Los datso del producto han sido guardados)
        }catch{
            print("No fue posible realizar la codificacion \(error)")
        }
    }
    
    func getProducts() -> [Producto] {
        if let data = App.shared.defaults.object(forKey: "productos") as? Data{
            let decoder = JSONDecoder()
            guard let productos = try? decoder.decode([Producto].self, from: data) else{
                fatalError("No fue posible realizar la decodificacion")
            }
            return productos
        }
        return [Producto]()
    }
    
    
}
