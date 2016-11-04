//
//  ActualityValidator.swift
//  RivneFish
//
//  Created by Anatolii Kyryliuk on 28/02/16.
//  Copyright © 2016 rivnefish. All rights reserved.
//

import Foundation

class ActualityValidator {
    static var actualityValidator = ActualityValidator()
    var serverLastChanges = 0

    func checkPlaces(_ completionHandler: @escaping (_ isOutdated: Bool) -> Void) {
        NetworkDataSource.sharedInstace.placesLastChanges({ (lastChanges: Int) in
            var outdated = true
            let defaults = UserDefaults.standard
            self.serverLastChanges = lastChanges

            let lastSavedNum = defaults.integer(forKey: Constants.Cache.kPlacesLastChangesKey)
            if lastSavedNum == self.serverLastChanges {
                outdated = false
            }
            completionHandler(outdated)
        })
    }

    func checkFish(_ completionHandler: @escaping (_ isOutdated: Bool) -> Void) {
        NetworkDataSource.sharedInstace.fishLastChanges({ (lastChanges: Int) in
            var outdated = true
            let defaults = UserDefaults.standard
            self.serverLastChanges = lastChanges

            let lastSavedNum = defaults.integer(forKey: Constants.Cache.kFishLastChangesKey)
            if lastSavedNum == self.serverLastChanges {
                outdated = false
            }
            completionHandler(outdated)
        })
    }

    func isUpToDate(cachedPlaceDetails: PlaceDetails, with newPlace: Place) -> Bool {
        var upToDate = false

        if let cachedDate = cachedPlaceDetails.modifiedDate,
            let newDate = newPlace.date {
            upToDate = (cachedDate.compare(newDate) == .orderedSame)
        }
        return upToDate
    }

    func updatePlacesLastChangesDate() {
        let defaults = UserDefaults.standard
        defaults.set(self.serverLastChanges, forKey: Constants.Cache.kPlacesLastChangesKey)
    }

    func updateFishLastChangesDate() {
        let defaults = UserDefaults.standard
        defaults.set(self.serverLastChanges, forKey: Constants.Cache.kFishLastChangesKey)
    }
}
