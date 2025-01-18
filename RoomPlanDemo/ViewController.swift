//
//  ViewController.swift
//  RoomPlanDemo
//
//  Created by Kedia on 2025/1/18.
//

import UIKit
import RoomPlan

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    private lazy var captureView: RoomCaptureView = {
        let view = RoomCaptureView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self.capureViewDelegate
        return view
    }()

    private lazy var capureViewDelegate: KDRoomCaptureDelegate = {
        KDRoomCaptureDelegate()
    }()
}

