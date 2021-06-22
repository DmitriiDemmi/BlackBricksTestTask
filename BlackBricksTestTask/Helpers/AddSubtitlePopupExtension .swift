//
//  AddSubtitlePopupExtension .swift
//  BlackBricksTestTask
//
//  Created by RM on 22.06.2021.
//

import Foundation
import UIKit

extension AddSubtitlePopup: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            self.startMinute = row
        case 1:
            self.startSecond = row
        case 2:
            self.stopMinute = row
        case 3:
            self.stopSecond = row
            
        default:
            print("No component with number \(component)")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let columnView = UILabel()
        columnView.text = String(format:"%02lu", row)
        return columnView
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0: return 25
        case 1: return 120
        case 2: return 25
        case 3: return 25
        default : return 20
        }
    }
    
}
