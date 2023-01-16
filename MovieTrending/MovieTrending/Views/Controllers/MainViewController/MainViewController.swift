//
//  MainViewController.swift
//  MovieTrending
//
//  Created by Boris Ofon on 1/13/23.
//

import UIKit

class MainViewController: UIViewController {

    //viewModels
    let viewModel = MainViewModel()
    
    let tableView = UITableView()
    let activityIndi = UIActivityIndicatorView()
    
    //variables
    var cellData = [MoviesResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Main controller"
        
        style()
        layout()
        
        setUpTableView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func bindViewModel(){
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self,
                  let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndi.startAnimating()
                } else {
                    self.activityIndi.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else {
                return
            }
            self.cellData = movies
            self.reloadTableView()
        }
    }
}



// MARK: - table view setup
extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        registerCell()
    }
    
    func registerCell(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movieData = cellData[indexPath.row]
        cell.textLabel?.text = viewModel.getMovieTitle(movieData)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
}
