//
//  Data.swift
//  ValoVision
//
//  Created by Yasin Kızıltaş on 13.11.2025.
//

import Foundation

// MARK: - Root
struct AgentData: Codable {
    let status: Int
    let data: [Agent]
}

// MARK: - Agent
struct Agent: Codable {
    let uuid: String
    let displayName: String
    let description: String?
    let developerName: String?
    let characterTags: [String]?
    let displayIcon: String?
    let displayIconSmall: String?
    let bustPortrait: String?
    let fullPortrait: String?
    let fullPortraitV2: String?
    let killfeedPortrait: String?
    let minimapPortrait: String?
    let background: String?
    let backgroundGradientColors: [String]?
    let assetPath: String
    let isFullPortraitRightFacing: Bool?
    let isPlayableCharacter: Bool?
    let isAvailableForTest: Bool?
    let isBaseContent: Bool?
    let role: Role?
    let recruitmentData: RecruitmentData?
    let abilities: [Ability]?
    let voiceLine: VoiceLine?
}

// MARK: - Ability
struct Ability: Codable {
    let slot: String?
    let displayName: String?
    let description: String?
    let displayIcon: String?
}

// MARK: - Role
struct Role: Codable {
    let uuid: String?
    let displayName: String?
    let description: String?
    let displayIcon: String?
    let assetPath: String?
}

// MARK: - Recruitment Data
struct RecruitmentData: Codable {
    let counterId: String?
    let milestoneId: String?
    let milestoneThreshold: Int?
    let useLevelVpCostOverride: Bool?
    let levelVpCostOverride: Int?
    let startDate: String?
    let endDate: String?
}

// MARK: - VoiceLine
struct VoiceLine: Codable {
    let minDuration: Double?
    let maxDuration: Double?
    let mediaList: [VoiceMedia]?
}

struct VoiceMedia: Codable {
    let id: Int?
    let wwise: String?
    let wave: String?
}
