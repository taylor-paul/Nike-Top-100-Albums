//
//  AlbumDetailsViewController.swift
//  Nike Top 100 Albums
//
//  Created by Taylor Paul on 7/16/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import UIKit

/// A view controller for displaying the details of an album.
class AlbumDetailViewController: UIViewController {

    /// The values to update the UI components.
    var albumViewModel: AlbumViewModel
    
    // MARK: - Initializers
    
    init(with albumViewModel: AlbumViewModel) {
        self.albumViewModel = albumViewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View controller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.center
        view.addSubview(stackView)
        
        let artworkImageView = UIImageView()
        artworkImageView.translatesAutoresizingMaskIntoConstraints = false
        artworkImageView.contentMode = .scaleAspectFit
        view.addSubview(artworkImageView)
        
        let copyrightLabel = UILabel()
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        copyrightLabel.numberOfLines = 0
        copyrightLabel.font = .preferredFont(forTextStyle: .footnote)
        copyrightLabel.textAlignment = .center
        view.addSubview(copyrightLabel)

        let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.font = .preferredFont(forTextStyle: .headline)

        let artistNameLabel = UILabel()
        artistNameLabel.numberOfLines = 0

        let releaseDateLabel = UILabel()
        
        let genreLabel = UILabel()
        
        // Add the views to the stack.
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(artistNameLabel)
        stackView.addArrangedSubview(releaseDateLabel)
        stackView.addArrangedSubview(genreLabel)

        // Setup the iTunes store button.
        let storeButton = UIButton()
        storeButton.translatesAutoresizingMaskIntoConstraints = false
        storeButton.addTarget(self, action: #selector(openItunes), for: .touchUpInside)
        storeButton.setTitle("Store", for: .normal)
        storeButton.backgroundColor = .systemBlue
        storeButton.layer.cornerRadius = 33
        storeButton.clipsToBounds = true
        view.addSubview(storeButton)
        
        // Create the constraints for the views.
        artworkImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        artworkImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        artworkImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        artworkImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        copyrightLabel.topAnchor.constraint(equalTo: artworkImageView.bottomAnchor, constant: 15).isActive = true
        copyrightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        copyrightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: storeButton.topAnchor, constant: -20).isActive = true
        
        storeButton.heightAnchor.constraint(equalToConstant: 66).isActive = true
        storeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        storeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        storeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        // Update the views with data from the view model.
        if let artworkUrl = albumViewModel.artworkUrl {
            ImageCache.shared.downloadImage(url: artworkUrl) { result in
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        artworkImageView.image = image
                    }
                case .failure(let error):
                    print("Failed to load album artwork: ", error)
                }
            }
        }
        copyrightLabel.text = albumViewModel.copyright
        nameLabel.text = albumViewModel.name
        artistNameLabel.text = albumViewModel.artistName
        releaseDateLabel.text = albumViewModel.releaseDate
        genreLabel.text = albumViewModel.genres
    }
    
    // MARK: - Button Actions

    @objc func openItunes() {
        guard let url = albumViewModel.albumUrl else {
            print("Attempted to open an invalid album url.")
            return
        }
        UIApplication.shared.open(url, options: [:])
    }

}

