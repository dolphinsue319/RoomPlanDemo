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
        view.addSubview(captureView)
        view.topAnchor.constraint(equalTo: captureView.safeAreaLayoutGuide.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: captureView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: captureView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: captureView.safeAreaLayoutGuide.trailingAnchor).isActive = true
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

