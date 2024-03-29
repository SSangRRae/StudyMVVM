//
//  SignUpViewModel.swift
//  StudyMVVM
//
//  Created by SangRae Kim on 2/22/24.
//

import Foundation

class SignUpViewModel {
    
    var inputText = SignUpObservable("")
    var outputText = SignUpObservable("")
    
    init() {
        inputText.bind { value in
            self.validation(value)
        }
    }
    
    private func validation(_ text: String) {
        if text.isEmpty {
            outputText.text = "닉네임을 입력해주세요"
            return
        }
        
        if text.contains("@") || text.contains("!") {
            outputText.text = "특수문자는 입력할 수 없습니다."
            return
        }
        
        if 5 <= text.count && text.count < 10 {
            outputText.text = "사용할 수 있는 닉네임입니다."
        } else {
            outputText.text = "5글자 이상 10글자 미만으로 입력해주세요"
        }
    }
}
