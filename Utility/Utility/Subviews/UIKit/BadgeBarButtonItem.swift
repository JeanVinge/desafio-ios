//
//  BadgeBarButton.swift
//  Utility
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

class BadgeView: GenericView {

    // MARK: Var

    lazy var badgeLabel = UILabel()
        .with
        .alpha(0.9)
        .textAlignment(.center)
        .textColor(.white)
        .font(.systemFont(ofSize: 9, weight: .semibold))
        .build()

    // MARK: Init

    override func initSubviews() {
        addSubview(badgeLabel)
        layer.cornerRadius = 9
        layer.masksToBounds = true
        backgroundColor = .red
        layer.zPosition = 1
        clipsToBounds = true
    }

    override func initConstraints() {
        badgeLabel.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
        }
    }
}

public class BadgeBarButtonItem: UIBarButtonItem, ConfigurableView {

    // MARK: Var

    public var badge: Int = 0 {
        didSet {
            updateBadge()
        }
    }

    lazy var badgeView = BadgeView()

    private var badgeLabel: UILabel {
        return badgeView.badgeLabel
    }

    // MARK: Init

    public override init() {
        super.init()
        initLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initLayout()
    }

    // MARK: ConfigurableView

    public func initSubviews() {
        addObserver(self, forKeyPath: "view", context: nil)
    }

    public func initConstraints() {}

    // MARK: Observer

    // swiftlint:disable block_based_kvo
    override public func observeValue(forKeyPath keyPath: String?,
                                      of object: Any?,
                                      change: [NSKeyValueChangeKey: Any]?,
                                      context: UnsafeMutableRawPointer?) {
        updateBadge()
    }

    private func updateBadge() {
        guard let view = value(forKey: "view") as? UIView else { return }
        badgeLabel.text = "\(badge)"
        if badge > 0 && badgeView.superview == nil {
            addBadge(in: view)
        } else if badge == 0 {
            badgeView.removeFromSuperview()
        }
    }

    private func addBadge(in view: UIView) {
        view.addSubview(badgeView)
        badgeView.layout {
            $0.width.constraint(equalToConstant: 18)
            $0.height.constraint(equalToConstant: 18)
            $0.centerX.equalToSuperView(9)
            $0.centerY.equalToSuperView(-9)
        }
    }

    deinit {
        self.removeObserver(self, forKeyPath: "view")
    }
}
