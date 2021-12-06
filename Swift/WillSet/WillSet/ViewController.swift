//
//  ViewController.swift
//  WillSet
//
//  Created by jinho on 2021/12/06.
//

import UIKit

class ViewController: UIViewController {
    
    private var text: String = "Default" {
        willSet {
            label.text = "Old: \(text) - New: \(newValue)"
        }
        didSet {
            print("DidSet: old - \(oldValue) - newValue: \(text)")
        }
    }
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.text = text
        label.center = view.center
        label.textAlignment = .center
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.text = "iOS Academy updated this!"
        }
    }


}

