//
//  File.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Class for Detecting Device Orientation
final class OrientationInfo: ObservableObject {
    
    ///Variables for orientation and observing change
    @Published var orientation: Orientation
    private var _observer: NSObjectProtocol?
    
    ///Enumeration for types of device orientations
    enum Orientation {
        case portrait
        case landscape
    }
    
    ///Initializes whether device is in portrait or landscape
    init() {
        if UIDevice.current.orientation.isLandscape {
            self.orientation = .landscape
        } else {
            self.orientation = .portrait
        }
        
        _observer = NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: nil) { [unowned self] input in
            guard let givenDevice = input.object as? UIDevice else {
                return
            }
            if givenDevice.orientation.isPortrait {
                self.orientation = .portrait
            }
            else if givenDevice.orientation.isLandscape {
                self.orientation = .landscape
            }
        }
    }
    
    ///De-initializes the obeserver
    deinit {
        if let currentObserver = _observer {
            NotificationCenter.default.removeObserver(currentObserver)
        }
    }
}
