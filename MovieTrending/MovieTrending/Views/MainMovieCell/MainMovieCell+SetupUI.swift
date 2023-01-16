//
//  MainMovieCell+SetupUI.swift
//  MovieTrending
//
//  Created by Boris Ofon on 1/16/23.
//

import Foundation
import UIKit

extension MainMovieCell {
    
    func styleCell(){
        self.layer.cornerRadius = 23
        
        //backView
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .systemGray
        backView.layer.cornerRadius = 23
        
        //posterImageView
        //posterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //dateLabel
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layoutCell(){
        contentView.addSubview(backView)
        //contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)

        
        NSLayoutConstraint.activate([
            //backView
            backView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            backView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: backView.bottomAnchor, multiplier: 1),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: backView.trailingAnchor, multiplier: 1),
            
            //posterImageView
//            posterImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
//            posterImageView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            
            //titleLabel
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 3),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 4),
            
            //dateLabel
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: dateLabel.bottomAnchor, multiplier: 3),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: dateLabel.trailingAnchor, multiplier: 4),
        ])
    }
}
