//
//  String_Extensions.swift
//  Food_Ordering
//
//  Created by Huy Binh on 19/08/2022.
//

import Foundation

extension String {
    var asUrl : URL? {
        return URL(string: self)
    }
}
