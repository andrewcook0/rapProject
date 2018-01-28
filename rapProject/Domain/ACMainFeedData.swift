//
//  ACMainFeedData.swift
//  rapProject
//
//  Created by andrew cook on 1/28/18.
//  Copyright © 2018 andrew cook. All rights reserved.
//

import Foundation
import Freddy

public class ACMainFeedData : JSONEncodable, JSONDecodable {
    
    public var promotedData: [ACMainFeedDataObject]?
    public var trendingData: [ACMainFeedDataObject]?
    public var recentData: [ACMainFeedDataObject]?
    
    public init() {}
    
    required public init(json: JSON) throws {
//        self.promotedData = try? json.getArray(at: "promotedData").map(ACMainFeedDataObject.init())
//        self.trendingData = try? json.getArray(at: "trendingData").map(ACMainFeedDataObject.init())
//        self.recentData = try? json.getArray(at: "recentData").map(ACMainFeedDataObject.init())
    }
    
    public func toJSON() -> JSON {
        var dict = [String: JSON]()
        if let val = self.promotedData { dict["promotedData"] = .array(val.map{ $0.toJSON() }) }
        if let val = self.trendingData { dict["trendingData"] = .array(val.map{ $0.toJSON() }) }
        if let val = self.recentData { dict["recentData"] = .array(val.map{ $0.toJSON() }) }
        return .dictionary(dict)
    }
}

public class ACMainFeedDataObject: JSONEncodable, JSONDecodable {
    
    public var name: String?
    public var title: String?
    public var rating: Int?
    
    public init() {}
    
    required public init(json: JSON) throws {
        self.name = try? json.getString(at: "name")
        self.title = try? json.getString(at: "title")
        self.rating = try? json.getInt(at: "rating")
    }
    
    public func toJSON() -> JSON {
        var dict = [String: JSON]()
        if let val = self.name { dict["name"] = .string(val) }
        if let val = self.title { dict["title"] = .string(val) }
        if let val = self.rating { dict["rating"] = .int(val) }
        return .dictionary(dict)
    }
}


