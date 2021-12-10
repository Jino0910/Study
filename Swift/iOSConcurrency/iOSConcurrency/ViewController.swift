//
//  ViewController.swift
//  iOSConcurrency
//
//  Created by jinho on 2021/12/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        callBackgroundWork()
    }
    
    func callBackgroundWork() {
        DispatchQueue.global(qos: .unspecified).async {
            
        }
    }

    func getData() {
        guard let url = URL(string: "") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, res, error in
            guard data != nil else { return }
            
            DispatchQueue.main.async {
                self.view.backgroundColor = .red
            }
        }
        
        task.resume()
    }
}

