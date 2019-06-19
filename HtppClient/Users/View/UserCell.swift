//
//  UserCell.swift
//  HtppClient
//
//  Created by ink on 19/06/2019.
//  Copyright © 2019 Vitaliy. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    func configure(with user: User) {
        self.loginLabel.text = user.login
        self.scoreLabel.text = String(user.score)
    }
}
