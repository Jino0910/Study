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
    
    var disposeBag: DisposeBag = DisposeBag()
    private lazy var emailSignInView = EmailSignInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func bind(reactor: ViewReactor2) {
        
        // Actions
        emailSignInView.emailField.rx.text.orEmpty
            .map{ Reactor.Action.updateValue(type: .email, value: $0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        emailSignInView.passwordField.rx.text.orEmpty
            .map{ Reactor.Action.updateValue(type: .password, value: $0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        emailSignInView.signInButton.rx.tap
            .map{ Reactor.Action.tapSignIn }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // States
        Observable.combineLatest(reactor.state.map{ $0.email },
                                 reactor.state.map{ $0.password },
                                 resultSelector: { ($0, $1) })
            .map{ !$0.0.isEmpty && !$0.1.isEmpty }
            .map{ Reactor.Action.updateEnableSignInButton($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state
            .map{ $0.enableSignInButton }
            .distinctUntilChanged()
            .bind(to: emailSignInView.signInButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        reactor.state
            .map{ $0.openErrorPopup }
            .map{ _ in "6자리 이상 비밀번호를 입력해주세요." }
            .bind(onNext: emailSignInView.showError)
            .disposed(by: disposeBag)
        
        reactor.state
            .map{ $0.goToMain }
            .bind(onNext: goToMain)
            .disposed(by: disposeBag)
    }
    
    
    private func goToMain() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            // goToMain()
        }
    }
}
