//
//  LoginCaptchaCell.swift
//  DebugCenter_Example
//
//  Created by imac on 2026/9/18.
//  Copyright © 2026 CocoaPods. All rights reserved.
//


import UIKit

protocol LoginCaptchaCellDelegate: NSObjectProtocol {
    func loginCaptchaCell(model: LoginCaptchaCell, success value: String)
}

class LoginCaptchaCell: UITableViewCell {

    static let identifier = "ServiceLoginCellID"

    weak var delegate: LoginCaptchaCellDelegate?

    lazy private var line: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()

    lazy private var textfield: UITextField = {
        let textfield = UITextField()
        textfield.layer.cornerRadius = 4
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.placeholder = "验证码"
        textfield.layer.masksToBounds = true
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftViewMode = .always
        textfield.delegate = self
        textfield.keyboardType = .numberPad
        return textfield
    }()

    static func cell(with tableview: UITableView) -> LoginCaptchaCell {
        var cell = tableview.dequeueReusableCell(withIdentifier: identifier) as? LoginCaptchaCell
        if cell == nil {
            cell = LoginCaptchaCell(style: .default, reuseIdentifier: identifier)
        }
        return cell!
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildUI() {
        selectionStyle = .none
        backgroundColor = .white

        contentView.addSubview(line)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textfield)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let width = contentView.bounds.width
        let height = contentView.bounds.height

        // MARK: - 分割线
        line.frame = CGRect(
            x: 15,
            y: height - 1,
            width: width - 15,
            height: 1
        )

        // MARK: - 标题
        let titleSize = titleLabel.sizeThatFits(
            CGSize(
                width: width - 30 - 150,
                height: height
            )
        )

        titleLabel.frame = CGRect(
            x: 15,
            y: (height - titleSize.height) / 2,
            width: titleSize.width,
            height: titleSize.height
        )

        // MARK: - 验证码输入框
        textfield.frame = CGRect(
            x: width - 15 - 150,
            y: 15,
            width: 150,
            height: height - 30
        )
    }
}

extension LoginCaptchaCell: UITextFieldDelegate {

    public func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {

        if let newText = (textField.text as NSString?)?.replacingCharacters(
            in: range,
            with: string
        ) {
            delegate?.loginCaptchaCell(
                model: self,
                success: newText
            )
        }

        return true
    }
}

