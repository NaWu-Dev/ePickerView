//
//  DataModel.swift
//  ePickerView
//
//  Created by Na Wu on 2016-12-26.
//  Copyright © 2016 Na Wu. All rights reserved.
//

import Foundation

class Poutine {
    
    var orderedPoutine : [String: String] = ["Type": "", "Size": ""]
    
    let poutineType : [String] = ["Classic", "Montreal smoked meat", "Bacon & Hot dogs", "Feta Cheese", "Mushroom & Onions", "Home made style"]
    
    let poutineSize : [String] = ["Mini", "Small", "Medium", "Large", "Super"]
    
    func columns() -> Int {
        return 2
    }
    
    func numberOfType() -> Int {
        return poutineType.count
    }
    
    func numberOfSize() -> Int {
        return poutineSize.count
    }
    
    func getPoutineType(index: Int) -> String {
        return poutineType[index]
    }
    
    func getPoutineSize(index: Int) -> String {
        return poutineSize[index]
    }
    
    func setOrder(type: Int, indexValue: Int) {
        switch type {
        case 0:
            orderedPoutine["Type"] = getPoutineType(index: indexValue)
        case 1:
            orderedPoutine["Size"] = getPoutineSize(index: indexValue)
        default:
            return
        }
    }
    
    func getOrder() -> [String: String] {
        return orderedPoutine
        
    }
}
