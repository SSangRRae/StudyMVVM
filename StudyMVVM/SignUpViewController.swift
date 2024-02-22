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
    
    let viewModel = SignUpViewModel()
    
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
        viewModel.inputText.text = nicknameTextField.text!
        validLabel.text = viewModel.outputText
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
