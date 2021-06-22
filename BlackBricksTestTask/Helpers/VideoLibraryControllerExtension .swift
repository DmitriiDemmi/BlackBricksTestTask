//
//  VideoLibraryControllerExtension .swift
//  BlackBricksTestTask
//
//  Created by RM on 22.06.2021.
//

import Foundation
import UIKit

extension VideoLibraryController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideoLibraryCustomCell.reuseId, for: indexPath) as! VideoLibraryCustomCell
        let video = videos[indexPath.row]
        cell.video = video
        return cell
    }
}
