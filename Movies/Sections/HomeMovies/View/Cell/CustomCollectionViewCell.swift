//
//  CustomCollectionViewCell.swift
//  Movies
//
//  Created by Wilson David Molina Lozano on 2/11/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var moviesImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var movies: MovieInfo? {
        didSet {
            setup()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /*
         // https://image.tmdb.org/t/p/w300/14QbnygCuTO0vl7CAFmPf1fgZfV.jpg{}
         */
    }

    
    private func setup() {
        nameLabel.text = movies?.name
        descriptionLabel.text = movies?.description
    
    }
    

}
