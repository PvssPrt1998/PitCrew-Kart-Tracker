//
//  ServerResponse.swift
//  PitCrew Kart Tracker
//
//  Created by Николай Щербаков on 23.07.2024.
//
import Foundation

// MARK: - Welcome
struct RemoteConfig: Codable {
    let codeTech: String // 1_0 key
    let server10: String // 1_0 server url
    let isAllChangeURL: String
    let isDead: String
    let lastDate: String
    let urlLink: String //link for webView
    let token: String

    enum CodingKeys: String, CodingKey {
        case codeTech
        case server10 = "server1_0"
        case isAllChangeURL, isDead, lastDate
        case urlLink = "url_link"
        case token
    }
}
