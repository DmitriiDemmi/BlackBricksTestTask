//
//  ViewController.swift
//  BlackBricksTestTask
//
//  Created by RM on 17.06.2021.
//

import UIKit
import AVKit

class VideoLibraryController: UIViewController {
    
    let tableView = UITableView()
    
    var videos: [Video] = Video.fetchVideos()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(VideoLibraryCustomCell.self, forCellReuseIdentifier: VideoLibraryCustomCell.reuseId)
        navigationItem.title = "Видео"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoPlayerController = VideoPlayerController()
        videoPlayerController.video = videos[indexPath.row]
        present(videoPlayerController, animated: true)
    }

}



