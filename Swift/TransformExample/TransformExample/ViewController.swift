//
//  ViewController.swift
//  TransformExample
//
//  Created by jinho on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {
    
    private let myView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myView)
        myView.backgroundColor = .systemBlue
        myView.frame = .init(x: 0, y: 0, width: 200, height: 200)
        myView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 0.3) {
                self.transform()
            } completion: { done in
                if done {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        UIView.animate(withDuration: 0.3) {
                            self.myView.transform = .identity
                        }
                    }
                }
            }
        }
    }

    func transform() {
        myView.transform = CGAffineTransform(rotationAngle: .pi / 2)
            .concatenating(CGAffineTransform(translationX: -100, y: -200))
            .concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))
    }
}

