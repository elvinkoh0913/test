//
//  contact.swift
//  testapp
//
//  Created by HEXA-TeckKai.Koh on 3/13/23.
//

import Foundation

struct Contacts: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String?
    let dob: String?
}
