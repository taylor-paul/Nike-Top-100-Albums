//
//  AlbumTableViewCell.swift
//  Nike Top 100 Albums
//
//  Created by Taylor Paul on 7/15/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import UIKit

/// A table view cell for displaying an *AlbumViewModel*.
class AlbumTableViewCell: UITableViewCell, Identifiable {
    
    /// The string identifier for cell re-use.
    static var identifier = "AlbumTableViewCellIdentifier"
    
    /// The album artwork.
    private let albumArtworkImageView: UIImageView = UIImageView()
    /// The abum's name.
    private let albumNameLabel: UILabel = UILabel()
    /// The album artist's name.
    private let artistNameLabel: UILabel = UILabel()
    
    /// The view model for updating the ui components.
    var albumViewModel: AlbumViewModel? {
        didSet {
            albumNameLabel.text = albumViewModel?.name
            
            let artistName = albumViewModel?.artistName ?? ""
            artistNameLabel.text = artistName
            artistNameLabel.accessibilityLabel = "by \(artistName)"

            if let imageURL = albumViewModel?.artworkUrl {
                ImageCache.shared.downloadImage(url: imageURL) { result in
                    switch result {
                    case .success(let albumImage):
                        DispatchQueue.main.async {
                            self.albumArtworkImageView.image = albumImage
                            self.setNeedsLayout()
                        }
                    case .failure(let error):
                        print("Failed to get album artwork: ", error)
                    }
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Configure the cell.
        selectionStyle = .none
        
        // Configure the UI elements.
        albumArtworkImageView.translatesAutoresizingMaskIntoConstraints = false
        albumArtworkImageView.contentMode = .scaleAspectFit
        contentView.addSubview(albumArtworkImageView)

        let labelStackView = UIStackView()
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.axis  = NSLayoutConstraint.Axis.vertical
        labelStackView.distribution  = UIStackView.Distribution.equalSpacing
        labelStackView.alignment = UIStackView.Alignment.leading
        contentView.addSubview(labelStackView)

        albumNameLabel.numberOfLines = 0
        albumNameLabel.font = .preferredFont(forTextStyle: .headline)
        labelStackView.addArrangedSubview(albumNameLabel)
        
        artistNameLabel.numberOfLines = 0
        artistNameLabel.font = .preferredFont(forTextStyle: .subheadline)
        labelStackView.addArrangedSubview(artistNameLabel)
        
        // Create the constrains for the view.
        albumArtworkImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        albumArtworkImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        albumArtworkImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        albumArtworkImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true

        labelStackView.leadingAnchor.constraint(equalTo: albumArtworkImageView.trailingAnchor, constant: 15).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        labelStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelStackView.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, constant: -20).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
