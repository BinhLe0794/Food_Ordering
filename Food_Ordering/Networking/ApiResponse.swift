//
//  ApiResponse.swift
//  Food_Ordering
//
//  Created by Huy Binh on 19/08/2022.
//

import Foundation

struct ApiResponse<T: Decodable> : Decodable {
    let Status : Int
    let Message : String?
    let ResultObj : T?
    let error : String?
}
