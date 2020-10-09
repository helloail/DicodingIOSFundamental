import Foundation

// MARK: - DetailGames
public struct DetailGames: Codable {
    init() {
           
    }
    var id: Int?
    var name, nameOriginal, detailGamesDescription: String?
    var released, backgroundImage: String?
    var rating: Double?
    var playtime: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case nameOriginal = "name_original"
        case detailGamesDescription = "description_raw"
        case released
        case backgroundImage = "background_image"
        case rating
        case playtime
        
    }
}

