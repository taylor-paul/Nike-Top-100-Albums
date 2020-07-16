//
//  AlbumsViewController.swift
//  Nike Top 100 Albums
//
//  Created by Taylor Paul on 7/15/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import UIKit

/// A view controller for displaying the top 100 albums.
class AlbumsViewController: UIViewController {
    
    /// The table view for displaying the albums.
    private let tableView = UITableView()

    /// The view models for the table view cells to update their UI components.
    private var albumViewModels = [AlbumViewModel]()

    // MARK: - View controller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchAlbums()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Top 100 Albums"
        
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
    
    // MARK: - Data Fetching
    
    /// Fetches the albums from the iTunes RSS feed.
    private func fetchAlbums() {
        AlbumApi.fetchAlbumsJSON { result in
            switch result {
            case .success(let albums):
                self.albumViewModels = albums.map({return AlbumViewModel(album: $0)})
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch albums: ", error)
            }
        }
    }

}

// MARK: - UITableViewDataSource

extension AlbumsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier  , for: indexPath)
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension AlbumsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let albumCell = cell as? AlbumTableViewCell else {
            return
        }

        let albumViewModel = albumViewModels[indexPath.row]
        albumCell.albumViewModel = albumViewModel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albumViewModels[indexPath.row]
        let detailsViewController = AlbumDetailViewController(with: album)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }

}
