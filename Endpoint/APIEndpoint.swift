//
//  APIEndpoint.swift
//  PokemonCards (iOS)
//
//  Created by Степан Усьянцев on 02.07.2021.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var headers: [String: Any] { get }
    var params: [String: String] { get }
    var urlRequest: URLRequest { get }
}

extension Endpoint {
    var fullURL: String {
        return baseURL + path
    }
}

enum APIEndpoint {
    case getCards(page: Int)
}

extension APIEndpoint: Endpoint {
    var baseURL: String {
        return "https://api.pokemontcg.io/v2"
    }

    var path: String {
        switch self {
        case .getCards:
            return "/cards"
        }
    }

    var headers: [String: Any] {
        return ["X-Api-Key": "7c8f5b9b-bb3a-4d18-be3d-838cdec60217"]
    }

    var params: [String: String] {
        var queryParams = ["pageSize": "5"]

        switch self {
        case .getCards(page: let pageNumber):
            queryParams.updateValue("\(pageNumber)", forKey: "page")
            return queryParams
        }
    }

    var urlRequest: URLRequest {
        var url = URLComponents(string: fullURL)!
        url.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }

        var request = URLRequest(url: url.url!)

        for header in headers {
            request.setValue(header.value as? String, forHTTPHeaderField: header.key)
        }

        return request
    }
}
