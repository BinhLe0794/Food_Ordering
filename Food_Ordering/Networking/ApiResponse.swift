//
//  ApiResponse.swift
//  Food_Ordering
//
//  Created by Huy Binh on 19/08/2022.
//

import Foundation

struct ApiResponse<T: Decodable> : Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
