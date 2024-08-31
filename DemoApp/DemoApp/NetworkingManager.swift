//
//  NetworkingManager.swift
//  DemoApp
//
//  Created by Saif on 30/08/2024.
//

import Foundation

class NetworkingManager {
  static func fetchListings() async throws -> [Model] {
    let url = URL(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer")!

    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    let (data, _) = try await URLSession.shared.data(for: request)
    let listings = try JSONDecoder().decode(ResponseModel.self, from: data)
      return listings.results
  }
}
