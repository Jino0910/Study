//
//  ViewReactor.swift
//  ReactorKit
//
//  Created by jinho on 2021/11/19.
//

import Foundation
import ReactorKit
import RxSwift

class ViewReactor2: Reactor {
    
    enum InputValue {
        case email
        case password
    }
    
    enum Action {
        // actiom cases
        case updateValue(type: InputValue,
                         value: String)
        case tapSignIn
    }
    
    enum Mutation {
        // mutation cases
        case updateValue(type: InputValue,
                         value: String)
    }
    
    struct State {
        //state
        var email: String
        var password: String
        var enableSignInButton: Bool
        var errorMessage: String
        var goToMain: Void
    }
    
    let initialState: State
    
    init() {
         initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
         switch action {
         case let .updateValue(type, email):
             
             
             return .just(.updateValue(type: type,
                                       value: email))
         case .tapSignIn:
             
         }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
         switch mutation {
         case let .updateValue(type, value):
             
             switch type {
             case .email:
                 newState.email = value
             case .password:
                 newState.password = value
             }
         }
        return newState
    }
}
