//
//  NewsCollectionViewCell.swift
//  Movies
//
//  Created by Juan Diego Marin on 4/11/22.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var moviesImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movies: ResultMovie? {
        didSet {
            setup()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setup() {
        nameLabel.text = movies?.title
        descriptionLabel.text = movies?.overview
        
        if let path = movies?.backdrop_path {
            moviesImage.downloaded(from: "https://image.tmdb.org/t/p/w300/\(path)", placeHolder: nil)
        }
    }
}
