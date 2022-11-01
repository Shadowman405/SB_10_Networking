//
//  Course.swift
//  SB_10_Networking
//
//  Created by Maxim Mitin on 1.11.22.
//

import Foundation

struct Course: Codable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_tests: Int?
}

struct WebsiteDescription: Codable {
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
}

