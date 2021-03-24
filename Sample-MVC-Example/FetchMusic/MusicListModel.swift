//
//  MusicList.swift
//  Music-Details-Design-Task
//
//  Created by ADMIN on 10/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import Foundation

// MARK: - MusicList
struct MusicList: Codable {
    let resultCount: Int?
    let results: [MusicResult]?
}

// MARK: - Result
struct MusicResult: Codable {
    let wrapperType: WrapperType?
    let artistID, collectionID: Int?
    let artistName, collectionName, collectionCensoredName: String?
    let artistViewURL, collectionViewURL: String?
    let artworkUrl60, artworkUrl100: String?
    let collectionPrice: Double?
    let collectionExplicitness: Explicitness?
    let trackCount: Int?
    let copyright: String?
    let country: Country?
    let currency: Currency?
    let releaseDate: String?
    let primaryGenreName: String?
    let previewURL: String?
    let resultDescription: String?
    let amgArtistID: Int?
    let kind: Kind?
    let trackID: Int?
    let trackName, trackCensoredName: String?
    let trackViewURL: String?
    let artworkUrl30: String?
    let trackPrice, trackRentalPrice, collectionHDPrice, trackHDPrice: Double?
    let trackHDRentalPrice: Double?
    let trackExplicitness: Explicitness?
    let trackTimeMillis: Int?
    let contentAdvisoryRating, shortDescription, longDescription: String?
    let hasITunesExtras: Bool?
    let collectionArtistID: Int?
    let collectionArtistViewURL: String?
    let discCount, discNumber, trackNumber: Int?
    let isStreamable: Bool?

    enum CodingKeys: String, CodingKey {
        case wrapperType
        case artistID = "artistId"
        case collectionID = "collectionId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName
        case previewURL = "previewUrl"
        case resultDescription = "description"
        case amgArtistID = "amgArtistId"
        case kind
        case trackID = "trackId"
        case trackName, trackCensoredName
        case trackViewURL = "trackViewUrl"
        case artworkUrl30, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case trackExplicitness, trackTimeMillis, contentAdvisoryRating, shortDescription, longDescription, hasITunesExtras
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case discCount, discNumber, trackNumber, isStreamable
    }
}

enum Explicitness: String, Codable {
    case cleaned = "cleaned"
    case explicit = "explicit"
    case notExplicit = "notExplicit"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
    case song = "song"
}

enum WrapperType: String, Codable {
    case audiobook = "audiobook"
    case track = "track"
}
