//
//  EndpointExtensions.swift
//  linphone
//
//  Created by Administrator on 08/11/2019.
//

import Foundation

// MARK: - Extension
struct Extension: Codable {
    let id, type, secret, username: String
    let extensionDescription: String
    let actions: Actions
    let proxyPort : Int?
    
    enum CodingKeys: String, CodingKey {
        case id, type, secret, username
        case extensionDescription = "description"
        case actions
        case proxyPort
    }
}

extension Extension {
    init?(from:[String:Any]){
        guard let id = from["id"] as? String,
            let type = from["type"] as? String,
            let extensionDescription = from["description"] as? String,
            let actions = from["actions"] as? [String: Any] else { return nil }
        
        // Secret, username and proxy_port can be nil.
        let secret = from["secret"] as? String
        let username = from["username"] as? String
        let proxyPort = from["proxy_port"] as? Int
        
        self.id = id
        self.type = type
        self.secret = secret ?? ""
        self.username = username ?? ""
        self.extensionDescription = extensionDescription
        self.actions = Actions(from:actions)!
        self.proxyPort = proxyPort
    }
}
