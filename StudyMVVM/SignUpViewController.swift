//
//  SignUpViewController.swift
//  StudyMVVM
//
//  Created by SangRae Kim on 2/22/24.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    let nicknameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "닉네임을 입력해주세요."
        return view
    }()
    
    let validLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    let pwTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "비밀번호를 입력해주세요."
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureHierarchy()
        configureConstraints()
        nicknameTextField.delegate = self
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if text.isEmpty {
            validLabel.text = "닉네임을 입력해주세요"
            return
        }
        
        if text.contains("@") || text.contains("!") {
            validLabel.text = "특수문자는 입력할 수 없습니다."
            return
        }
        
        if 5 <= text.count && text.count < 10 {
            validLabel.text = "사용할 수 있는 닉네임입니다."
        } else {
            validLabel.text = "5글자 이상 10글자 미만으로 입력해주세요"
        }
        
    }
}

extension SignUpViewController {
    func configureHierarchy() {
        view.addSubview(nicknameTextField)
        view.addSubview(validLabel)
        view.addSubview(pwTextField)
    }
    
    func configureConstraints() {
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(view).inset(32)
            make.height.equalTo(50)
        }
        
        validLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.height.equalTo(30)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(validLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view).inset(32)
            make.height.equalTo(50)
        }
    }
}
