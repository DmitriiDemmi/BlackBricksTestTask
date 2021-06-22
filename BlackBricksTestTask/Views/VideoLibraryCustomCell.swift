//
//  VideoLibraryCustomCell.swift
//  BlackBricksTestTask
//
//  Created by RM on 17.06.2021.
//

import UIKit
import EasyPeasy


class VideoLibraryCustomCell: UITableViewCell {
    
    static let reuseId = "videoLibraryCustomCell"
    
    var videoPreviewImage: UIImageView = {
        let vpi = UIImageView()
        vpi.contentMode = .scaleToFill
        return vpi
    }()
    
    var videoTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    var video: Video? = nil {
        didSet {
            videoPreviewImage.image = UIImage(named: video!.image)
            videoTitle.text = video?.title
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(videoPreviewImage)
        addSubview(videoTitle)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        videoPreviewImage.easy.layout([Width(390), Height(220), CenterX()])
        videoTitle.easy.layout([Width(100), Height(50), CenterX(-130), CenterY(-90)])
    }
    
    
}
