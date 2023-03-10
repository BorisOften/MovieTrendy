//
//  MainViewController+SetupUI.swift
//  MovieTrending
//
//  Created by Boris Ofon on 1/13/23.
//

import UIKit

//MARK: - styling and layout
extension MainViewController {
    
    func style()  {
        // tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //activity indicator
        activityIndi.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout() {
        view.addSubview(tableView)
        view.addSubview(activityIndi)
        
        // tableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 1),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            // activity indicator
            activityIndi.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndi.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

