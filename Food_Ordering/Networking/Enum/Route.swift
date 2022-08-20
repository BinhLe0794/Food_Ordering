//
//  Route.swift
//  Food_Ordering
//
//  Created by Huy Binh on 18/08/2022.
//

import Foundation

enum Route {
    static let baseUrl = "http://localhost:4000"
    
    case fetchAllCategories
    
    var description : String {
        // tự động tham chiếu tới chính nó
        switch self {
        case .fetchAllCategories : return "/dish-categories"
        }
    }
}

