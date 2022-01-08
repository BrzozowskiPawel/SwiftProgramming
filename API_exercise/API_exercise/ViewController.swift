//
//  ViewController.swift
//  API_exercise
//
//  Created by Paweł Brzozowski on 08/01/2022.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://api.sunrise-sunset.org/json?lat=52.3893&lng=16.9138"
        // Do any additional setup after loading the view.
        getData(from: url)
    }
    
    private func getData(from url: String) {
        // Create a request
        let URLObject =  URL(string: url)
        
        URLSession.shared.dataTask(with: URLObject!) { data, response, error in
            guard let data = data, error == nil else {
                print("SMT went wrong")
                return
            }
            
            // Conver a data to the struct (JSON decoding)
            var resualt: Response?
            do {
                resualt = try JSONDecoder().decode(Response.self, from: data)
                
            } catch {
                print("ERROR with decoding")
            }
            
            guard let json = resualt else {
                print("ERROR")
                return
            }
            
            print(json.results)
        }.resume()
    }
}

// MARK: - data structs

// Codable protocol allows to convert data to the struct.
struct Response: Codable {
    let results: MyResults
    let status: String
}

struct MyResults: Codable {
    let sunrise: String
    let sunset: String
    let solar_noon: String
    let day_length: String
    let civil_twilight_begin: String
    let civil_twilight_end: String
    let nautical_twilight_begin: String
    let nautical_twilight_end: String
    let astronomical_twilight_begin: String
    let astronomical_twilight_end: String
}
