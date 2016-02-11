//
//  Event.swift
//  TrinityEvents
//
//  Created by Jane Appleseed on 5/26/15.
//  Copyright © 2015 Apple Inc. All rights reserved.
//  See LICENSE.txt for this sample’s licensing information.
//

import UIKit

class Event {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    //var rating: Int

    // MARK: Initialization
    
    init?(name: String, photo: UIImage?) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
    }

}