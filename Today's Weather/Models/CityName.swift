//
//  CityName.swift
//  Today's Weather
//
//  Created by Khalid Gad on 16/07/2024.
//

import Foundation

enum CityName: String {
    case cairo = "cairo"
    case giza = "giza"
    case alexandria = "alexandria"
    case aswan = "aswan"
    case assiut = "assiut"
    case beheira = "beheira"
    case beniSuef = "beniSuef"
    case dakahlia = "dakahlia"
    case damietta = "damietta"
    case fayoum = "fayoum"
    case gharbia = "gharbia"
    case ismailia = "ismailia"
    case kafrElSheikh = "kafrElSheikh"
    case matrouh = "matrouh"
    case minya = "minya"
    case menofia = "menofia"
    case northSinai = "northSinai"
    case portSaid = "portSaid"
    case qualyubia = "qualyubia"
    case qena = "qena"
    case redSea = "redSea"
    case alSharqia = "alSharqia"
    case southSinai = "southSinai"
    case suez = "suez"
    case luxor = "luxor"
    case sohag = "sohag"
    
    var cityName: String {
        
        NSLocalizedString(self.rawValue, comment: "city Label")
    }
        
}
