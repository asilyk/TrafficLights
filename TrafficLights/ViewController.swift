//
//  ViewController.swift
//  TrafficLights
//
//  Created by Alexander on 25.12.2021.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IB Outlets
    @IBOutlet private var startButton: UIButton!

    @IBOutlet private var lightsStackView: UIStackView!

    @IBOutlet private var yellowLightView: UIView!
    @IBOutlet private var redLightView: UIView!
    @IBOutlet private var greenLightView: UIView!

    //MARK: - Enumerations
    private enum WhatLightIsOn {
        case red
        case yellow
        case green
        case none
    }

    //MARK: - Private Properties
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3

    private var whatLightIsOn = WhatLightIsOn.none

    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10

        for lightView in lightsStackView.arrangedSubviews {
            lightView.layer.cornerRadius = lightView.frame.size.width / 2
            lightView.alpha = lightIsOff
        }
    }

    //MARK: - IB Actions
    @IBAction private func startButtonPressed() {
        switch whatLightIsOn {
        case .none:
            startButton.setTitle("Next", for: .normal)
            whatLightIsOn = .red
            redLightView.alpha = lightIsOn

        case .red:
            whatLightIsOn = .yellow
            redLightView.alpha = lightIsOff
            yellowLightView.alpha = lightIsOn

        case .yellow:
            whatLightIsOn = .green
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOn

        case .green:
            whatLightIsOn = .red
            greenLightView.alpha = lightIsOff
            redLightView.alpha = lightIsOn
        }
    }
}
