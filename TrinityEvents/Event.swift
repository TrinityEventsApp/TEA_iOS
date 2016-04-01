import UIKit

class Event {
    // MARK: Properties
//this class is used to hold all the data associated with an event
    var name: String
    var societyName: String
    var eventDescription: String?
    var photo: UIImage?
    var startDate: NSDate
    var endDate: NSDate
    var location: String?
    //var id: Int?
    
    // MARK: Initialization
    
//    init?(name: String, photo: UIImage?) {
//        // Initialize stored properties.
//        self.name = name
//        self.photo = photo
//        self.societyName = ""
//    }
    
    init?(name: String,societyName: String,eventDescription: String?,photo: UIImage?,startDate: NSDate, endDate: NSDate, location: String?) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.societyName = societyName
        self.eventDescription = eventDescription
        self.startDate = startDate
        self.endDate = endDate
        self.location = location
    }
}