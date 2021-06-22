//
//  Video.swift
//  BlackBricksTestTask
//
//  Created by RM on 17.06.2021.
//

import Foundation

struct Video {
    let url: URL
    let title: String
    let image: String
    
    static func fetchVideos() -> [Video] {
        
        var videos: [Video] = []
        
        let videoTitles = ["Лес", "Море", "Озеро"]
        let imageNames = ["videopreview1", "videopreview2", "videopreview3"]
        let videoNames = ["3", "2", "1"]

        for (index, name) in videoNames.enumerated() {
            let urlPath = Bundle.main.path(forResource: name, ofType: "mp4")!
            let url = URL(fileURLWithPath: urlPath)
            let video = Video(url: url, title: videoTitles[index], image: imageNames[index])
            videos.append(video)
        }
        return videos
    }
   
}
