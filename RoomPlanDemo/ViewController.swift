//
//  ViewController.swift
//  RoomPlanDemo
//
//  Created by Kedia on 2025/1/18.
//

import UIKit
import RoomPlan

class ViewController: UIViewController {

    enum ButtonTitle: String {
        case start = "Start"
        case stop = "Stop"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(captureView)
        view.addSubview(captureButton)

        captureView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        captureView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        captureView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        captureView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        captureButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        captureButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        captureButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        captureButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private lazy var captureView: RoomCaptureView = {
        let view = RoomCaptureView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self.capureViewDelegate
        return view
    }()

    private let sessionConfig: RoomCaptureSession.Configuration = .init()
    private lazy var capureViewDelegate: KDRoomCaptureDelegate = {
        KDRoomCaptureDelegate()
    }()

    private let captureButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(ButtonTitle.start.rawValue, for: .normal)
        button.addTarget(self, action: #selector(updateCapture), for: .touchUpInside)
        return button
    }()

    @objc private func updateCapture() {
        guard let title = captureButton.title(for: .normal) else { return }
        if title == ButtonTitle.start.rawValue {
            captureButton.setTitle( ButtonTitle.stop.rawValue, for: .normal)
            captureView.captureSession.run(configuration: sessionConfig)
        }
        else {
            captureButton.setTitle( ButtonTitle.start.rawValue, for: .normal)
            captureView.captureSession.stop()
        }
    }
}

