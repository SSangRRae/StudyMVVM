//
//  NumberViewController.swift
//  StudyMVVM
//
//  Created by SangRae Kim on 2/22/24.
//

import UIKit
import SnapKit

class NumberViewController: UIViewController {
    
    let numberTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "숫자를 입력해주세요"
        return view
    }()
    
    let resultLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureHierarchy()
        configureConstraints()
        
        numberTextField.delegate = self
    }
}

extension NumberViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = numberTextField.text else { return }
        
        if text.isEmpty {
            resultLabel.text = "값을 입력해주세요"
            return
        }
        
        guard let num = Int(text) else {
            resultLabel.text = "숫자만 입력해주세요"
            return
        }
        
        if 0 < num && num <= 1000000 {
            resultLabel.text = num.formatted()
        } else {
            resultLabel.text = "1,000,000 이하로 입력해주세요"
        }
    }
}

extension NumberViewController {
    func configureHierarchy() {
        view.addSubview(numberTextField)
        view.addSubview(resultLabel)
    }
    
    func configureConstraints() {
        numberTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(view).inset(32)
            make.height.equalTo(50)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view).inset(32)
            make.height.equalTo(22)
        }
    }
}
