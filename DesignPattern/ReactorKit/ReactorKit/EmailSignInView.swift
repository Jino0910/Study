//
//  EmailSignInView.swift
//  MVVM
//
//  Created by jinho on 2021/11/19.
//

import Then
import UIKit

class EmailSignInView: UIView {

    let emailField = UITextField()
        
    let passwordField = UITextField()
    
    let errorLabel = UILabel().then {
        $0.isHidden = true
    }
        
    let signInButton = UIButton().then {
        $0.isEnabled = false
    }
    
    // 필요한 코드만 최소한으로 작성하였습니다.
    // ...
    
    func showError(message: String) { // 로그인 결과 에러메시지가 발생할경우 호출되는 함수입니다.
        errorLabel.isHidden = false
        errorLabel.text = message
    }
}
