//
//  ApiError.swift
//  ForYouDicodingFundamentalSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 23/09/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//

import Foundation

public struct ApiErrorCode {
    public static let unkownErrorId = -1
}

public struct ApiError: Codable, Error {
    public let id: Int
    public let message: String
    public let field: String?
    
    public init(id: Int, message: String) {
        self.id = id
        self.message = message
        self.field = nil
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case message = "message"
        case field = "field"
    }
}
