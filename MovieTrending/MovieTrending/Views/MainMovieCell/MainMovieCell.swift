//
//  MainMovieCell.swift
//  MovieTrending
//
//  Created by Boris Ofon on 1/16/23.
//

import UIKit

class MainMovieCell: UITableViewCell {

    public static var identifier :String {
        get {
            return "MainMovieCell"
        }
    }
    
    let backView = UIView()
    let posterImageView = UIImageView()
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        styleCell()
        layoutCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(viewModel: MovieCellViewModel) {
        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.date
    }
}
