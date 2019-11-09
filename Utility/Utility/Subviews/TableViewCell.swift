//
//  TableViewCell.swift
//  Utility
//
//  Created by jean.vinge on 22/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

final public class TableViewCell<T: TableViewRepresentation>: ReusableTableViewCell, ConfigurableView {

    // MARK: Var

    lazy var wrappedView = T()

    // MARK: Init
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        wrappedView.prepareForReuse()
    }

    public override init(style: UITableViewCell.CellStyle,
                         reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        initLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLayout()
    }

    public func initSubviews() {
        contentView.addSubview(wrappedView)
        wrappedView.configure(self)
    }

    public func initConstraints() {
        wrappedView.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
        }
    }

    override func configure(at indexPath: IndexPath, with object: Any? = nil) {
        guard let object = object as? T.Content else { return }
        wrappedView.setup(with: object)
    }
}
