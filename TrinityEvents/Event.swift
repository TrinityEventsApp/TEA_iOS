

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