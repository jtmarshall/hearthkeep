//
//  Constants.swift
//  hearthkeep
//
//  Created by Jordan  on 3/31/17.
//  Copyright © 2017 Jordan . All rights reserved.
//

import Foundation

struct Constants {
    
    // Hearthstone API Endpoints
    struct Hearthstone {
        // Returns all available Hearthstone cards including non collectible cards.
        static let APIBaseURL = "https://omgvamp-hearthstone-v1.p.mashape.com/cards"
        
        // Returns a list of all the card backs.
        static let CardBacksURL = "https://omgvamp-hearthstone-v1.p.mashape.com/cardbacks"
        
        // Returns cards by partial name.
        static let CardSearchURL = "https://omgvamp-hearthstone-v1.p.mashape.com/cards/search/{name}"
        
        // Returns all cards in a set. Example values: Blackrock Mountain, Classic.
        static let CardSetURL = "https://omgvamp-hearthstone-v1.p.mashape.com/cards/sets/{set}"
        
        // Returns all the cards of a class. Example values: Mage, Paladin.
        static let CardsByClassURL = "https://omgvamp-hearthstone-v1.p.mashape.com/cards/classes/{class}"
        
        // Returns all the cards of a certain faction. Example values: Horde, Neutral.
        static let CardsByFactionURL = "https://omgvamp-hearthstone-v1.p.mashape.com/cards/factions/{faction}"
        
        // Returns all the cards of a certain quality. Example values: Legendary, Common.
        static let CardsByQualityURL = "https://omgvamp-hearthstone-v1.p.mashape.com/cards/qualities/{quality}"
        
        // Returns all the cards of a certain race. Example values: Mech, Murloc.
        static let CardsByRaceURL = "https://omgvamp-hearthstone-v1.p.mashape.com/cards/races/{race}"
        
        // Returns all the cards of a certain type. Example values: Spell, Weapon.
        static let CardsByTypeURL = "https://omgvamp-hearthstone-v1.p.mashape.com/cards/types/{type}"
        
        // Returns a list of current patch, classes, sets, types, factions, qualities, races and locales.
        static let InfoURL = "https://omgvamp-hearthstone-v1.p.mashape.com/info"
        
        // Returns card by name or ID. This may return more then one card if they share the same name. Loatheb returns both the card and the boss.
        static let SingleCardURL = "https://omgvamp-hearthstone-v1.p.mashape.com/cards/{name}"
    }
    
    // MARK: Flickr Parameter Keys
    struct HSParameterKeys {
        static let Method = "method"
        static let APIKey = "X-Mashape-Key"
        static let GalleryID = "gallery_id"
        static let Extras = "extras"
        static let Format = "format"
        static let NoJSONCallback = "nojsoncallback"
    }
    
    // MARK: Flickr Parameter Values
    struct HSParameterValues {
        static let APIKey = "7zwIYKpiApmshixtxCSMWSD0eVaEp1rU1KdjsnpNUHYnniv5p4"
        static let ResponseFormat = "json"
        static let DisableJSONCallback = "1" /* 1 means "yes" */
        static let GETMethod = "GET"
        static let GalleryID = "66911286-72157647263150569"
        static let MediumURL = "url_m"
    }
    
    // MARK: Flickr Response Keys
    struct HSResponseKeys {
        static let Status = "stat"
        static let CardClass = "playerClass"
        static let CardID = "cardId"
        static let CardSet = "cardSet"
        static let CardType = "type"
        static let IsCollectible = "collectible"
        static let Health = "health"
        static let Image = "img"
        static let ImageGold = "imgGold"
        static let Locale = "locale"
        static let Name = "name"
        static let Rarity = "rarity"
        
    }
    
    // MARK: Flickr Response Values
    struct HSResponseValues {
        static let OKStatus = "ok"
    }
}
