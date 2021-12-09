//
//  SecondViewController.swift
//  CoordinatorPattern
//
//  Created by jinho on 2021/12/09.
//

import UIKit

class SecondViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second"
        view.backgroundColor = .systemBlue
    }
}
