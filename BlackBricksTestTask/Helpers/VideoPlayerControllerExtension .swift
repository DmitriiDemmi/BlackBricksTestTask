//
//  VideoPlayerControllerExtension .swift
//  BlackBricksTestTask
//
//  Created by RM on 22.06.2021.
//

import Foundation
import AVFoundation


extension VideoPlayerController: VideoPlayerVcDelegate {
    
    func setSubtitle(_ subtitleText: String?, startSecond: Int, stopSecond: Int, startMinute: Int, stopMinute: Int) {
        
        func addBoundaryTimeObserver() {
            let subtitleStartTime = startSecond + (startMinute * 60)
            let subtitleStopTime = stopSecond + (stopMinute * 60)
            
            let startTime = CMTime(value: CMTimeValue(subtitleStartTime), timescale: 1)
            let endTime = CMTime(value: CMTimeValue(subtitleStopTime), timescale: 1)
            
            var times = [NSValue]()
            
            times.append(NSValue(time: startTime))
            times.append(NSValue(time: endTime))

            player.addBoundaryTimeObserver(forTimes: times, queue: .main) {
                
                let currentTime = self.player.currentTime()
                let currentSecond = Int(CMTimeGetSeconds(currentTime))
                self.subtitle.text = subtitleText!
                if Int(endTime.seconds) == currentSecond {
                    self.subtitle.text = ""
                }
            }
        }
        addBoundaryTimeObserver()
    }
    
}
