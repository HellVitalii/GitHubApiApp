//
//  UserDetailsViewController.swift
//  HtppClient
//
//  Created by ink on 19/06/2019.
//  Copyright © 2019 Vitaliy. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    var login: String?

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var blog: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var hireable: UILabel!
    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var repos: UILabel!
    @IBOutlet weak var gists: UILabel!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var following: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func viewDidLoad() {
        setActivityIndicator(visible: true)
        UserDetailsNetworkService.getUserDetails(login: login!) { (response) in
            self.fillData(with: response.userDetails)
            self.setActivityIndicator(visible: false)
        }
    }
    
    @IBAction func BackButton(_ sender: UIButton) {
        
    }
    func fillData (with userDetails: UserDetails) {
        let missingParametrsDefaultText = "Missing"
        
        loginLabel.text = login!
        name.text = userDetails.name ?? missingParametrsDefaultText
        company.text  = userDetails.company ?? missingParametrsDefaultText
        blog.text  = userDetails.blog ?? missingParametrsDefaultText
        location.text  = userDetails.location ?? missingParametrsDefaultText
        email.text  = userDetails.email ?? missingParametrsDefaultText
        hireable.text  = userDetails.hireable != nil ?  "\(userDetails.hireable!)" : missingParametrsDefaultText
        bio.text  = userDetails.bio ?? missingParametrsDefaultText
        repos.text = userDetails.repos != nil ?  "\(userDetails.repos!)" : missingParametrsDefaultText
        gists.text  = userDetails.gists != nil ?  "\(userDetails.gists!)" : missingParametrsDefaultText
        followers.text  = userDetails.followers != nil ?  "\(userDetails.followers!)" : missingParametrsDefaultText
        following.text = userDetails.following != nil ?  "\(userDetails.following!)" : missingParametrsDefaultText
        
        if userDetails.avatarUrl != nil {
            avatarImageView.load(url: URL(string: userDetails.avatarUrl!)!	)
        }
    }
    private func setActivityIndicator(visible: Bool) {
        if visible {
            activityIndicator.isHidden = false
            contentView.isHidden = true
            activityIndicator.startAnimating()
        } else {
            activityIndicator.isHidden = true
            contentView.isHidden = false
            activityIndicator.stopAnimating()
        }
        
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

