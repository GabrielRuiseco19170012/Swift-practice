//
//  App.swift
//  FormularioA2
//
//  Created by mac13 on 29/01/21.
//  Copyright © 2021 UTT. All rights reserved.
//

import UIKit

class App: NSObject {
    static let shared = App()
    let defaults = UserDefaults.standard
    var productos:[Producto]
        = []
}
