//
//  ViewController.swift
//  HtppClient
//
//  Created by ink on 15/06/2019.
//  Copyright © 2019 Vitaliy. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var selectedIndexCell = -1
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setActivityIndicator(visible: false)
    }
    func showEmptyQueryWarning () {
        
        let alertController = UIAlertController(title: "Search field is empty", message: "Please, fill search field", preferredStyle: .alert)
        
            let action1 = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                
            }
        
            alertController.addAction(action1)

        self.present(alertController, animated: true, completion: nil)
    }
    
    private func setActivityIndicator(visible: Bool) {
        if visible {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        } else {
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func pressSearch() {
        
        guard searchTF.text != nil && !searchTF.text!.isEmpty else {
            showEmptyQueryWarning()
            return
        }
        setActivityIndicator(visible: true)
        UserNetworkService.getUsers(info: searchTF.text!) { (response) in
            self.setActivityIndicator(visible: false)
            self.users = response.users
            self.tableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? UserDetailsViewController else {return}
        
        guard selectedIndexCell >= 0 else {return}
        dvc.login = users[selectedIndexCell].login
    }
}

extension UsersViewController: UITableViewDelegate {}

extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserCell
        let user = users[indexPath.row]
        cell.configure(with: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexCell = indexPath.row
        performSegue(withIdentifier: "UserDetails", sender: nil)
    }
}
