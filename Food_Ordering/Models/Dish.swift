//
//  Dish.swift
//  Food_Ordering
//
//  Created by Huy Binh on 19/08/2022.
//

import Foundation

struct Dish {
    let id,name, description, image: String?
    let calories : Double?
    
    var formattedCalories : String {
        return String(format: "%.2f calories", calories ?? 0)
    }
}
