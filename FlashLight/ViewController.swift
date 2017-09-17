//
//  ViewController.swift
//  FlashLight
//
//  Created by Mihai Ruber on 9/16/17.
//  Copyright © 2017 Mihai Ruber. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var onOffLbl: UILabel!
    @IBOutlet weak var toggleBtn: UIButton!
    
    //Setting Defaul value
    var switchStatus: SwitchStatus = .off
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func toggleBtnWasPressed(_ sender: Any) {
        switchStatus.toggle()
        if switchStatus == .off {
            toggleOff()
            view.backgroundColor = UIColor.darkGray
            toggleBtn.setImage(UIImage(named: "offBtn"), for: .normal)
            onOffLbl.text = "OFF"
            onOffLbl.textColor = UIColor.white
        } else {
            toggleOn()
            view.backgroundColor = UIColor.white
            toggleBtn.setImage(UIImage(named: "onBtn"), for: .normal)
            onOffLbl.text = "ON"
            onOffLbl.textColor = UIColor.black
        }
    }
    
    func toggleOn() {
        if let device = AVCaptureDevice.default(for: AVMediaType.video), device.hasTorch {
            
            do {
                try device.lockForConfiguration()
                device.torchMode = .on
                device.unlockForConfiguration()
            }
            catch {
                print("Error")
            }
            
        }
        
        
    }
    
    func toggleOff() {
        if let device = AVCaptureDevice.default(for: AVMediaType.video), device.hasTorch {
            
            do {
                try device.lockForConfiguration()
                device.torchMode = .off
                device.unlockForConfiguration()
            }
            catch {
                print("Error")
            }
            
        }
        
        
    }

}

