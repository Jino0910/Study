//
//  ViewController.swift
//  Generics
//
//  Created by jinho on 2021/12/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        APICaller.shared.performAPICall(url: "https://api.service.com/getCars", expectingReturnType: Car.self) { result in
            switch result {
            case .success(let car):
                print(car.carModel)
            case .failure(let error):
                print(error)
            }
        }
        
        APICaller.shared.performAPICall(url: "https://api.service.com/getFruits", expectingReturnType: Fruit.self) { result in
            switch result {
            case .success(let fruit):
                print(fruit.name)
            case .failure(let error):
                print(error)
            }
        }
    }

}

class APICaller {
    static let shared = APICaller()
    
    public func performAPICall<T: Codable>(url: String, expectingReturnType: T.Type, completion: @escaping ((Result<T, Error>) -> Void)) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, _, error in
            guard let data = data, error == nil else { return }
            
            let decodedResult: T?
            decodedResult = try? JSONDecoder().decode(T.self, from: data)
            
            guard let result = decodedResult else { return }
            
            
            completion(.success(result))
        }
        
//        URLSession.shared.dataTask(with: URL(string: "foo")!) { data, _, error in
//            guard let data = data, error == nil else { return }
//
//            let decodedResult: T?
//            do {
//                decodedResult = try JSONDecoder.decode(T.self, from: data)
//
//            }
//            catch {
//                decodedResult = nil
//            }
//        }
        
        task.resume()
    }
}

struct Fruit: Codable {
    let name: String
    let identifier: String
    let imageName: String
}

struct Car: Codable {
    let carModel: String
    let name: String
    let identifier: String
    let imageName: String
}

struct Recipers: Codable {
    let name: String
    let recipersType: String
    let identifier: String
    let imageName: String
}
