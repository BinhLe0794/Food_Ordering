//
//  AppError.swift
//  Food_Ordering
//
//  Created by Huy Binh on 18/08/2022.
//

import Foundation

enum AppError : LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String?{
        switch self{
            
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Ohhs Somethings wrong"
        case .invalidUrl:
            return "The Url is invalid"
        case .serverError(let error):
            return error
        }
    }
}
