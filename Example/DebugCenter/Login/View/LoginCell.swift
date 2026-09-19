//
//  LoginCell.swift
//  DebugCenter_Example
//
//  Created by imac on 2026/9/18.
//  Copyright © 2026 CocoaPods. All rights reserved.
//

import UIKit

class LoginCell: UITableViewCell {

    static let identifier = "LoginCellID"

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

    lazy var icon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    static func cell(with tableview: UITableView) -> LoginCell {
        var cell = tableview.dequeueReusableCell(withIdentifier: identifier) as? LoginCell
        if cell == nil {
            cell = LoginCell(style: .default, reuseIdentifier: identifier)
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
        contentView.addSubview(icon)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let width = contentView.bounds.width
        let height = contentView.bounds.height

        // 分割线
        line.frame = CGRect(
            x: 15,
            y: height - 1,
            width: width - 15,
            height: 1
        )

        // 标题
        let titleSize = titleLabel.sizeThatFits(
            CGSize(width: width - 30 - 150, height: height)
        )

        titleLabel.frame = CGRect(
            x: 15,
            y: (height - titleSize.height) / 2,
            width: titleSize.width,
            height: titleSize.height
        )

        // 图片
        icon.frame = CGRect(
            x: width - 15 - 150,
            y: 2,
            width: 150,
            height: height - 5
        )
    }
}
