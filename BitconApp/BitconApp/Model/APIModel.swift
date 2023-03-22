//
//  APIModel.swift
//  BitconApp
//
//  Created by Ziutzel grajales on 21/03/23.
//

import Foundation

struct Bitcoin: Codable {
    let time : String
    let asset_id_quote: String
    let rate: Double
    
}
