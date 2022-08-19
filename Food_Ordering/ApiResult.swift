//
//  ApiResult.swift
//  Food_Ordering
//
//  Created by Huy Binh on 19/08/2022.
//

import Foundation
// MARK: - Welcome
struct ApiResult: Decodable {
    let message: String
    let status: Int
    let resultObj: ResultObj

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case status = "Status"
        case resultObj = "ResultObj"
    }
}

// MARK: - ResultObj
struct ResultObj: Decodable {
    let username, token: String
}

