//
//  KDRoomCaptureDelegate.swift
//  RoomPlanDemo
//
//  Created by Kedia on 2025/1/18.
//

import Foundation
import RoomPlan
import Combine

class KDRoomCaptureDelegate: RoomCaptureViewDelegate {

    let usdFileDidSave = PassthroughSubject<URL, Never>()

    init () {
        
    }

    func encode(with coder: NSCoder) {

    }

    required init?(coder: NSCoder) {
        return nil
    }


    /// Asks the delegate for permission to present post-processed scan results.
    func captureView(shouldPresent roomDataForProcessing: CapturedRoomData, error: (any Error)?) -> Bool {
        return true
    }

    /// Provides the delegate with the post-processed scan results once the view presents them.
    func captureView(didPresent processedResult: CapturedRoom, error: (any Error)?) {
        let destinationURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("result.usd")
        do {
            try processedResult.export(to: destinationURL)
            usdFileDidSave.send(destinationURL)
        }
        catch {
            print("processedResult.export error: \(error)")
        }
    }

}
