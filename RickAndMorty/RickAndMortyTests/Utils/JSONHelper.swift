//
//  JSONHelper.swift
//  RickAndMortyTests
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation

struct JSONHelper {
    static func loadJSONData(fromFilename filename: String) -> Data? {
        @objc class TestClass: NSObject { }
        
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
}
