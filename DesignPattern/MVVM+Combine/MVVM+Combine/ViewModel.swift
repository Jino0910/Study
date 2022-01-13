//
//  ViewModel.swift
//  MVVM
//
//  Created by jinho on 2021/11/19.
//

import UIKit
import Combine

class ViewModel{
    
    var cancellables = Set<AnyCancellable>()
    
    var action = Action()
    var state = State()
    
    struct Action {
        let email = PassthroughSubject<String, Never>()
        let password = PassthroughSubject<String, Never>()
        let tapSignIn = PassthroughSubject<Void, Never>()
    }
    
    struct State {
        let enableSignInButton = CurrentValueSubject<Bool, Never>(false)
        let errorMessage = CurrentValueSubject<String, Never>("")
        let goToMain = CurrentValueSubject<Void, Never>(())
    }
    
    init() {
        
        Publishers.CombineLatest(action.email, action.password)
            .map{ !$0.0.isEmpty && !$0.1.isEmpty }
            .sink { [weak self]enable in
                self?.state.enableSignInButton.send(enable)
            }
            .store(in: &cancellables)
        
        action.tapSignIn
            .map{ _ in
                <#code#>
            }
            .sink { _ in
                
            }
            .store(in: &cancellables)

//
//        input.tapSignIn
//            .withLatestFrom(
//                Observable.combineLatest(input.email,
//                                         input.password))
//            .bind { [weak self] (email, password) in
//                guard let self = self else { return }
//                if password.count < 6 {
//                    self.output.errorMessage.accept("6자리 이상 비밀번호를 입력해주세요.")
//                } else {
//                    // API 태우기
//
//                    self.output.goToMain.accept(())
//                }
//            }
//            .disposed(by: disposeBag)
    }
}
