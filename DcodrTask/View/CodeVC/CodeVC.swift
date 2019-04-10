//
//  CodeVC.swift
//  DcodrTask
//
//  Created by Subham Padhi on 09/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class CodeVC: UIViewController , UISearchResultsUpdating , UITableViewDataSource , UITableViewDelegate{
    
    var codeViewModel = [CodeViewModel]()
    
    let searchController = UISearchController(searchResultsController:nil)

    func updateSearchResults(for searchController: UISearchController) {
    }
    
    var floatingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        button.contentMode = .scaleAspectFit
        button.setImage(#imageLiteral(resourceName: "Add"), for: .normal)
        button.addTarget(self, action: #selector(CodeVC.floatingButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func floatingButtonPressed() {
    }
    
    var table: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        view.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setUpSearchBar()
        
        getJson(url: Utils.GET_CODES_INFO)
        table.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
        setUpViews()
    }
    
    func getJson(url: String) {
        
        guard let url = URL(string:url) else {return}
        URLSession.shared.dataTask(with: url) { (data, response
            , error) in
            if let error = error {
                Utils.showAlert(title: "Oops", message: "\(error.localizedDescription)", presenter: self)
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            do {
                let json:AnyObject =  try (JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? NSArray)!
                print(json)
                let decoder = JSONDecoder()
                let value = try decoder.decode([CodeResponse]?.self, from: data)
                self.codeViewModel = value?.map({return CodeViewModel(codeResponse: $0)}) ?? []
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            } catch let err {
                Utils.showAlert(title: "Oops", message: "\(err.localizedDescription)", presenter: self)
            }
            }.resume()
    }
    
    
    func setUpViews() {
        
        table.dataSource = self
        table.delegate = self
        
        view.addSubview(table)
        table.addSubview(floatingButton)
        
        
        table.register(SearchResultsCell.self, forCellReuseIdentifier: "searchResultsCell")
        table.register(FilterListCell.self, forCellReuseIdentifier: "filterListCell")
        table.separatorStyle = .none
        
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        if #available(iOS 11.0, *) {
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        
        floatingButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        floatingButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        if #available(iOS 11.0, *) {
            floatingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        } else {
            floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        }
        floatingButton.layer.cornerRadius = 25
        
    
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "filterListCell") as! FilterListCell
            cell.selectionStyle = .none
            return cell
        } else {
            let codeViewModel = self.codeViewModel[indexPath.row - 1]
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultsCell") as! SearchResultsCell
            cell.listView.removeAllTags()
            cell.selectionStyle = .none
            cell.listView.addTags(codeViewModel.tags!)
            cell.codeViewModel = codeViewModel
            return cell
        }
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 70
        }else {
            print(view.frame.height)
            return 270
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(codeViewModel.count)
        return (codeViewModel.count + 1)
    }
    
    func setUpSearchBar() {
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.barTintColor = #colorLiteral(red: 0.1568627451, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        table.tableHeaderView = searchController.searchBar
    }
    
    func setUpNavigationBar() {
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2431372549, green: 0.2549019608, blue: 0.3254901961, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Code"
        titleLabel.font = UIFont.systemFont(ofSize: 17.0, weight: UIFont.Weight.light)
        titleLabel.textColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        navigationItem.titleView = titleLabel
    }
}
