//
//  WeatherDetails.swift
//  ToDoWithWeather
//
//  Created by Akua Afrane-Okese on 2025/11/11.
//

import Foundation

struct WeatherDetails: Codable {
    
    var location: LocationDetails?
    var current: CurrentDetails?
    var astronomy: AstronomyDetails?
}

struct LocationDetails: Codable {
    
    var name: String?
    var region: String?
    var country: String?
    var latitude: Double?
    var longitude: Double?
    var timezoneId: String?
    var localtimeEpoch: Int?
    var localtime: String?
    
    enum CodingKeys: String, CodingKey {
        
        case name
        case region
        case country
        case latitude = "lat"
        case longitude = "lon"
        case timezoneId = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}

struct CurrentDetails: Codable {
    
    var lastUpdatedEpoch: Int?
    var lastUpdated: String?
    var tempC: Double?
    var tempF: Double?
    var isDay: Int?
    var condition: ConditionDetails?
    var windMph: Double?
    var windKph: Double?
    var windDegree: Double?
    var windDir: String?
    var pressureMb: Double?
    var pressureIn: Double?
    var precipitationMm: Double?
    var precipitationIn: Double?
    var humidity: Int?
    var cloud: Int?
    var feelsLikeC: Double?
    var feelsLikeF: Double?
    var windchillC: Double?
    var windchillF: Double?
    var heatindexC: Double?
    var heatindexF: Double?
    var dewpointC: Double?
    var dewpointF: Double?
    var visKm: Double?
    var visMiles: Double?
    var uv: Double?
    var gustMph: Double?
    var gustKph: Double?
    var shortRad: Double?
    var diffRad: Double?
    var dni: Double?
    var gti: Double?

    enum CodingKeys: String, CodingKey {
        
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipitationMm = "precip_mm"
        case precipitationIn = "precip_in"
        case humidity
        case cloud
        case feelsLikeC = "feelslike_c"
        case feelsLikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case visKm = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case shortRad = "short_rad"
        case diffRad = "diff_rad"
        case dni
        case gti
    }
}

struct ConditionDetails: Codable {
    
    var text: String?
    var icon: String?
    var code: Int?
}

struct AstronomyDetails: Codable {
    
    var astro: AstroDetails?
}

struct AstroDetails: Codable {
    
    var sunrise: String?
    var sunset: String?
    var moonrise: String?
    var moonset: String?
    var moonPhase: String?
    var moonIllumination: String?
    
    enum CodingKeys: String, CodingKey {
        
        case sunrise
        case sunset
        case moonrise
        case moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
    }
}

