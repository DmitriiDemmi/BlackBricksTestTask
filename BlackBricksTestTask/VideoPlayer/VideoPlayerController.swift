//
//  VideoPlayerController.swift
//  BlackBricksTestTask
//
//  Created by RM on 17.06.2021.
//

import UIKit
import AVFoundation
import EasyPeasy

class VideoPlayerController: UIViewController {
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var url = URL(fileURLWithPath: "")    
    let videoView = UIView()

    var video: Video? {
        
        didSet {
            url = video?.url ?? URL(fileURLWithPath: "")
            videoTitleLabel.text = video?.title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        player = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize
        videoView.layer.addSublayer(playerLayer)

        observeVideoProgressTime()
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(videoView)
        view.addSubview(addSubtitleButton)
        view.addSubview(videoSlider)
        view.addSubview(currentVideoTimeLabel)
        view.addSubview(lengthVideoLabel)
        view.addSubview(videoTitleLabel)
        view.addSubview(subtitle)
        
        videoTitleLabel.easy.layout([Top(30).to(view), CenterX()])
        videoSlider.easy.layout([Width().like(videoView), Top().to(videoView), CenterX()])
        addSubtitleButton.easy.layout([CenterX(140), CenterY(240), Height(50), Width(50)])
        videoView.easy.layout([CenterX(), Width(400), Height(300), CenterY(-140)])
        currentVideoTimeLabel.easy.layout([Top(10).to(videoSlider), Right(-40).to(videoSlider)])
        lengthVideoLabel.easy.layout([Top(10).to(videoSlider), Left(-40).to(videoSlider)])
        subtitle.easy.layout([Width().like(videoView), Top(-40).to(videoView), CenterX()])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = videoView.bounds
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pausePressed))
        videoView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.play()
    }
    
    var isPlaying = false
    
    @objc func pausePressed() {
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying = !isPlaying
    }
    
    @objc func handleSliderChange() {
        if let duration = player.currentItem?.duration {
            let totalSeconds = CMTimeGetSeconds(duration)
            let value = Float64(videoSlider.value) * totalSeconds
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            player?.seek(to: seekTime)
        }
    }
    
    @objc func addButtonPressed() {
        let addSubtitlePopup = AddSubtitlePopup()
        addSubtitlePopup.videoPlayerVcDelegate = self
        present(addSubtitlePopup, animated: true)
        player.pause()
    }
    
    func observeVideoProgressTime() {
        let interval = CMTime(value: 2, timescale: 2)
        player.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main) { (progressTime) in
            let seconds = CMTimeGetSeconds(progressTime)
            let secondsText = String(format: "%02d", Int(seconds) % 60)
            let minutesText = String(format: "%02d", Int(seconds) / 60)
            self.currentVideoTimeLabel.text = "\(minutesText):\(secondsText)"
            
            if let duration = self.player.currentItem?.duration {
                let durationSeconds = CMTimeGetSeconds(duration)
                self.videoSlider.value = Float(seconds / durationSeconds)
                let seconds = CMTimeGetSeconds(duration)
                let secondsText = Int(seconds) % 60
                let minutesText = String(format: "%02d", Int(seconds) / 60)
                self.lengthVideoLabel.text = "\(minutesText):\(secondsText)"
            }
        }
    }
    
    // MARK: - views
    
    let addSubtitleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let currentVideoTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let lengthVideoLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var videoSlider: CustomSlider = {
        let slider = CustomSlider()
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }()
    
    let subtitle: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    let videoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
}
