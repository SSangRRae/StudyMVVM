//
//  Observable.swift
//  StudyMVVM
//
//  Created by SangRae Kim on 2/22/24.
//

import Foundation

class Observable {
    
    var closure: (() -> Void)?
    
    var text: String {
        didSet {
            closure?()
        }
    }
    
    init(_ text: String) {
        self.text = text
    }
    
    func bind(_ closure: @escaping () -> Void) {
        closure()
        self.closure = closure
    }
}
