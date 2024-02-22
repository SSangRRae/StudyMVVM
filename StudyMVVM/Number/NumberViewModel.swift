//
//  NumberViewModel.swift
//  StudyMVVM
//
//  Created by SangRae Kim on 2/22/24.
//

import Foundation

class NumberViewModel {
    
    var inputText = NumberObservable(text: "")
    var outputText = NumberObservable(text: "")
    
    init() {
        inputText.bind {
            self.validation()
        }
    }
    
    private func validation() {
        guard let text = inputText.text else { return }
        
        if text.isEmpty {
            outputText.text = "값을 입력해주세요"
            return
        }
        
        guard let num = Int(text) else {
            outputText.text = "숫자만 입력해주세요"
            return
        }
        
        if 0 < num && num <= 1000000 {
            outputText.text = num.formatted()
        } else {
            outputText.text = "1,000,000 이하로 입력해주세요"
        }
    }
}
