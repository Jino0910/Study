//
//  ViewController.swift
//  MVVM+Combine
//
//  Created by jinho on 2021/12/14.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    var cancellables = Set<AnyCancellable>()
    
    private lazy var emailSignInView = EmailSignInView()
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    private func bindViewModel() {
        
        // Bind input
        emailSignInView.emailField.textPublisher
//            .sink(receiveValue: )
//            .bind(to: viewModel.input.email)
//            .disposed(by: disposeBag)
//        emailSignInView.passwordField.rx.text.orEmpty
//            .bind(to: viewModel.input.password)
//            .disposed(by: disposeBag)
//        emailSignInView.signInButton.rx.tap
//            .bind(to: viewModel.input.tapSignIn)
//            .disposed(by: disposeBag)
//        
//        // Bind output
//        viewModel.output.enableSignInButton
//            .observe(on: MainScheduler.instance)
//            .bind(to: emailSignInView.signInButton.rx.isEnabled)
//            .disposed(by: disposeBag)
//        
//        viewModel.output.errorMessage
//            .observe(on: MainScheduler.instance)
//            .bind(onNext: emailSignInView.showError)
//            .disposed(by: disposeBag)
//        
//        viewModel.output.goToMain
//            .observe(on: MainScheduler.instance)
//            .bind(onNext: goToMain)
//            .disposed(by: disposeBag)
    }
    
    private func goToMain() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            // goToMain()
        }
    }
}

extension UITextField {

    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(
            for: UITextField.textDidChangeNotification,
            object: self
        )
        .compactMap { ($0.object as? UITextField)?.text }
        .eraseToAnyPublisher()
    }

}
