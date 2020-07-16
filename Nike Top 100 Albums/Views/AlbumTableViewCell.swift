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
    
    /// The view model for updating the ui components.
    var albumViewModel: AlbumViewModel? {
        didSet {
            textLabel?.text = albumViewModel?.name
            
            let artistName = albumViewModel?.artistName ?? ""
            detailTextLabel?.text = artistName
            detailTextLabel?.accessibilityLabel = "by \(artistName)"

            if let imageURL = albumViewModel?.artworkUrl {
                ImageCache.shared.downloadImage(url: imageURL) { result in
                    switch result {
                    case .success(let albumImage):
                        DispatchQueue.main.async {
                            self.imageView?.image = albumImage
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
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        detailTextLabel?.accessibilityLabel = "by"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
