//
//  WeatherNetworkManager.swift
//  ToDoWithWeather
//
//  Created by Akua Afrane-Okese on 2025/11/12.
//

import Foundation

enum WeatherType {
    case current
    case astronomy
}

struct WeatherNetworkManager {
    
    private func buildURL(searchTerm: String, type: WeatherType, dateString: String? = nil) -> URL {
        var fileString: String = ""
        var urlQueryItems: [URLQueryItem] = []
        urlQueryItems.append(URLQueryItem(name: "q", value: searchTerm))
        switch(type){
            case .current:
            fileString = "current"
            urlQueryItems.append(URLQueryItem(name: "aqi", value: "no"))
            case .astronomy:
            fileString = "astronomy"
            if let dateString {
                urlQueryItems.append(URLQueryItem(name: "dt", value: dateString))
            }
        }
        let baseURL = "https://api.weatherapi.com/v1/\(fileString).json?key=\(Constants.api)"
        
        guard let url = URL(string: baseURL)?
                    .appending(queryItems: urlQueryItems) else {
            fatalError()
                }
        return url
    }
    
    func fetchAndDecode<T: Decodable>(url: URL, type: T.Type) async throws -> T {
            let(data,urlResponse) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
        guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
            fatalError()
                }
        
            return try decoder.decode(type, from: data)
        }
    
    func getSearchResults(searchTerm: String, type: WeatherType, dateString: String? = nil) async -> WeatherDetails {
        let fetchURL = buildURL(searchTerm: searchTerm, type: type, dateString: dateString)
        var weatherDetails: WeatherDetails?
        do {
            weatherDetails = try await fetchAndDecode(url: fetchURL, type: WeatherDetails.self)
        } catch let error {
            print(error)
        }
        return weatherDetails ?? WeatherDetails()
    }
}
