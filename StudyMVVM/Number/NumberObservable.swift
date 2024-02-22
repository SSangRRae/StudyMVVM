//
//  NumberObservable.swift
//  StudyMVVM
//
//  Created by SangRae Kim on 2/22/24.
//

import Foundation

class NumberObservable {
    
    var closure: (() -> Void)?
    var text: String? {
        didSet {
            closure?()
        }
    }
    
    init(text: String?) {
        self.text = text
    }
    
    func bind(_ closure: @escaping () -> Void) {
        closure()
        self.closure = closure
    }
}
