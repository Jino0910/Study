//
//  ViewController.swift
//  ReactorKit
//
//  Created by jinho on 2021/11/19.
//

import UIKit
import ReactorKit
import RxSwift

final class ViewController: UIViewController, View {
    
    private let disposeBag: DisposeBag = DisposeBag()
    private lazy var emailSignInView = EmailSignInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func bind(reactor: ViewReactor2) {
        //binding here
        
//        emailSignInView.emailField.rx.text.orEmpty
//            .bind(to: viewModel.input.email)
//            .disposed(by: disposeBag)
//        emailSignInView.passwordField.rx.text.orEmpty
//            .bind(to: viewModel.input.password)
//            .disposed(by: disposeBag)
//        emailSignInView.signInButton.rx.tap
//            .bind(to: viewModel.input.tapSignIn)
//            .disposed(by: disposeBag)
//
//        reactor.cu
//
//        // Bind output
//        viewModel.output.enableSignInButton
//            .observe(on: MainScheduler.instance)
//            .bind(to: emailSignInView.signInButton.rx.isEnabled)
//            .disposed(by: disposeBag)
//        viewModel.output.errorMessage
//            .observe(on: MainScheduler.instance)
//            .bind(onNext: emailSignInView.showError)
//            .disposed(by: disposeBag)
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
