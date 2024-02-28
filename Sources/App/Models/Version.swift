//
//  File.swift
//  
//
//  Created by Salva Moreno on 28/2/24.
//

import Vapor

struct Version: Content {
    let current: String
    let live: String
    let needsUpdate: Bool
}
