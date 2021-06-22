//
//  AddSubtitlePopup.swift
//  BlackBricksTestTask
//
//  Created by RM on 20.06.2021.
//

import UIKit
import EasyPeasy

protocol VideoPlayerVcDelegate {
    func setSubtitle(_ subtitleText: String?, startSecond: Int, stopSecond: Int, startMinute: Int, stopMinute: Int)
}

class AddSubtitlePopup: UIViewController {
    
    var videoPlayerVcDelegate: VideoPlayerVcDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(containerView)
        containerView.easy.layout([CenterX(),CenterY(), Width(350), Height(350)])
        startSubtitlePickerView.dataSource = self
        startSubtitlePickerView.delegate = self
        setupContainerViews()
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
    }
    
    func setupContainerViews() {
        containerView.addSubview(addButton)
        containerView.addSubview(subtitleTextField)
        containerView.addSubview(startSubtitlePickerView)
        
        addButton.easy.layout([Bottom(10).to(containerView), CenterX().to(containerView), Width(100), Height(50)])
        subtitleTextField.easy.layout([Top(75).to(containerView), CenterX().to(containerView), Width(300), Height(40)])
        startSubtitlePickerView.easy.layout([Bottom(120).to(containerView), CenterX().to(containerView), Width(350), Height(50)])
    }
    
    @objc func addButtonPressed() {        
        videoPlayerVcDelegate?.setSubtitle(subtitleTextField.text,
                                           startSecond: startSecond,
                                           stopSecond: stopSecond,
                                           startMinute: startMinute,
                                           stopMinute: stopMinute)
        dismiss(animated: true)
    }
    
    var startSecond:Int = 0
    var startMinute:Int = 0
    var stopSecond:Int = 0
    var stopMinute:Int = 0
    
    
    // MARK: - views
    
    let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        return button
    }()
    
    let subtitleTextField: UITextField = {
        let textField = UITextField()
        textField.text = ""
        textField.textColor = .black
        textField.backgroundColor = .placeholderText
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    let startSubtitlePickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    let endSubtitlePickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 24
        return container
    }()
    

}



