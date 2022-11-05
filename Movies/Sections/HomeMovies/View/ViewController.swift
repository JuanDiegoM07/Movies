
//  ViewController.swift
//  Movies
//
//  Created by Juan Diego Marin on 1/11/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    // Private Properties
        
    private var viewModel = MoviesViewModel(repository: MovieRepository())
        
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.register(.init(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        viewModel.getMovie()
        viewModel.success = {
            self.movieCollectionView.reloadData()
        }
        viewModel.error = { error in
            print(error)
        }
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? NewsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .cyan
        cell.movies = viewModel.movies[indexPath.row]
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: view.bounds.height - 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
}
