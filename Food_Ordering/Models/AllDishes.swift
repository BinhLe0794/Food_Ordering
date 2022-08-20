//
//  AllDishes.swift
//  Food_Ordering
//
//  Created by Huy Binh on 20/08/2022.
//

import Foundation

struct AllDishes: Decodable {
    
      let categories: [DishCategory]?
      let populars: [Dish]?
      let specials: [Dish]?
}
