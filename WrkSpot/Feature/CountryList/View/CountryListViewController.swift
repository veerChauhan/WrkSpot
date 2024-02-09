//
//  CountryListViewController.swift
//  Wrkspot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import UIKit

class CountryListViewController: UIViewController {
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var countryListTableView: UITableView!
    @IBOutlet weak var navigationBar: NaviagtionBar!
    var countryListViewModel: CountryListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCountryListScreen()
        countryListViewModel = CountryListViewModel(delegate: self)
        countryListViewModel.loadCountryDetails()

    }
    
    
    private func configureCountryListScreen() {
        self.navigationBar.customizeProfileContainer(cornerRadiusOption: .round)
        self.navigationBar.startUpdatingDateAndTime()
        self.configureCountryListTableView()
        self.configureSearchView()
        
    }
    
    private func configureSearchView() {
        self.searchTextField.delegate = self
        self.searchView.layer.cornerRadius = 5
        self.searchView.layer.borderColor = UIColor.lightGray.cgColor
        self.searchView.layer.borderWidth = 1.0
    }
    private func configureCountryListTableView() {
        self.countryListTableView.delegate = self
        self.countryListTableView.dataSource = self
        self.countryListTableView.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CountryCell")
    }

}

extension CountryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryListViewModel.countryDetailsCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let singleCountryDetail = countryListViewModel[indexPath.row] else {return UITableViewCell()}

        guard let countryCell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell else {
            print("Country cell is not Available, Please check file and Target")
            return UITableViewCell()
        }
        countryCell.configureCoutry(with: singleCountryDetail)
        return countryCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

extension CountryListViewController: CountryListPresenterProtocol {
    
    func didFetchCountryDetails() {
        self.countryListTableView.reloadData()
    }
    
    func didFailedFetchingCountryDetail() {
    }
}

extension  CountryListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.searchTextField.resignFirstResponder() 
        return true
    }
}
