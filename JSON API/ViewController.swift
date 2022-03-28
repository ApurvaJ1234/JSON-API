//
//  ViewController.swift
//  JSON API
//
//  Created by coditas on 28/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let jsonURL = Bundle(for: type(of: self)).path(forResource: "parse", ofType: "json") else{
            return
        }
        
        guard let jsonString = try? String(contentsOf: URL(fileURLWithPath: jsonURL), encoding: String.Encoding.utf8) else{
            return
        }
        //jsn
        var person: Person?
        do{
            person = try JSONDecoder().decode(Person.self, from: Data(jsonString.utf8))
        }
        catch{
            print("Error occured while decoding")
        }
        
        guard let result = person else{
            print("no result")
            return
        }
        
        print(result.first_name)
        print(result.last_name)
        print(result.age)
        print(result.country)
        print(result.siblings)
    }


}

struct Person: Codable{
    let first_name: String
    let last_name: String
    let age: String
    let country: String
    let siblings: [String]
}
