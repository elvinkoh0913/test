//
//  ViewController.swift
//  testapp
//
//  Created by HEXA-TeckKai.Koh on 3/13/23.
//

import UIKit

class ViewController: UIViewController {
    
    var contactData: [Contacts]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        if let localData = self.readLocalFile(name: "data") {
            self.parse(jsonData: localData)
        }
    }
    
    private func readLocalFile(name name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(Array<Contacts>.self, from: jsonData)
            
            self.contactData = decodedData
            self.contactData?.forEach({ valuefromData in
                print("self", valuefromData)
            })
        } catch {
            print(error)
        }
    }
}

