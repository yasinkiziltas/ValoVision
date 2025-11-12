//
//  Data.swift
//  ValoVision
//
//  Created by Yasin Kızıltaş on 13.11.2025.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let status: Int
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let uuid, displayName, description, developerName: String
    let releaseDate: Date
    let characterTags: [String]?
    let displayIcon, displayIconSmall, bustPortrait, fullPortrait: String
    let fullPortraitV2, killfeedPortrait, minimapPortrait: String
    let homeScreenPromoTileImage: String?
    let background: String
    let backgroundGradientColors: [String]
    let assetPath: String
    let isFullPortraitRightFacing, isPlayableCharacter, isAvailableForTest, isBaseContent: Bool
    let role: Role
    let recruitmentData: RecruitmentData?
    let abilities: [Ability]
    let voiceLine: JSONNull?
}

// MARK: - Ability
struct Ability: Codable {
    let slot: Slot
    let displayName, description: String
    let displayIcon: String?
}

enum Slot: String, Codable {
    case ability1 = "Ability1"
    case ability2 = "Ability2"
    case grenade = "Grenade"
    case passive = "Passive"
    case ultimate = "Ultimate"
}

// MARK: - RecruitmentData
struct RecruitmentData: Codable {
    let counterID, milestoneID: String
    let milestoneThreshold: Int
    let useLevelVpCostOverride: Bool
    let levelVpCostOverride: Int
    let startDate, endDate: Date

    enum CodingKeys: String, CodingKey {
        case counterID = "counterId"
        case milestoneID = "milestoneId"
        case milestoneThreshold, useLevelVpCostOverride, levelVpCostOverride, startDate, endDate
    }
}

// MARK: - Role
struct Role: Codable {
    let uuid: String
    let displayName: DisplayName
    let description: String
    let displayIcon: String
    let assetPath: String
}

enum DisplayName: String, Codable {
    case controller = "Controller"
    case duelist = "Duelist"
    case initiator = "Initiator"
    case sentinel = "Sentinel"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}
