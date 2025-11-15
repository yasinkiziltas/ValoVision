//
//  EventData.swift
//  ValoVision
//
//  Created by Yasin Kızıltaş on 15.11.2025.
//

import Foundation

struct EventData: Codable {
   let status: String?
    let data: [Event]
}

struct Event: Codable {
    let uuid: String
    let displayName: String
    let startTime: Date
    let endTime: Date
    let assetPath: String?
}
