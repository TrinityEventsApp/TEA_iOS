import UIKit
import Foundation

class EventTableViewController: UITableViewController, UIDocumentInteractionControllerDelegate {
    // MARK: Properties
    var events = [Event]()
    //var filePath: NSURL!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEvents()
    }
    
    func loadEvents() {
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentDirectoryPath:String = path[0]
        let filePath = NSURL(fileURLWithPath: documentDirectoryPath.stringByAppendingString("/getEvents.json"))
        let data = NSData(contentsOfURL: filePath)! //Data is from the file
        var events1 = [Event]()
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            
//--------------------------------JSON PARSING------------------------------------
            
            if let result = json["result"] as? [[String: AnyObject]] {
                for entry in result {
                    let decodedData = NSData(base64EncodedString: entry["Low Res"] as! String, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters) //get get the imagedata from the string (should store as a byte arrray?)
                    
                    let decodedImage = UIImage(data: decodedData!) //convert that data into an image we can use
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateStyle = .MediumStyle
                    dateFormatter.timeStyle = .NoStyle
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    let startDate:NSDate = dateFormatter.dateFromString(entry["Start Date"] as! String)!
                    let endDate:NSDate = dateFormatter.dateFromString(entry["End Date"] as! String)!
                    //let event = Event(name: entry["Event Name"] as! String,photo: decodedImage)   //create an event with the society and Image of that JSON entry
                    //let event = Event(name: entry["Event Name"] as! String,photo: decodedImage)
                    let event = Event(name: entry["Event Name"] as! String,societyName: (entry["Society Name"] as! String),eventDescription: (entry["Event Description"] as? String),photo: decodedImage,startDate: startDate, endDate: endDate, location: (entry["Destination"] as? String))
                    events1 += [event!] //add it to the array of events
                    }
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
        for e in events1.sort({$0.startDate.compare($1.startDate) == NSComparisonResult.OrderedAscending})
        {
            events += [e]
        }
//---------------------------------------------------------------------------------
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 2
//    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "EventTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventTableViewCell
        
        // Fetches the appropriate event for the data source layout.
        let event = events[indexPath.row]
        
        cell.nameLabel.text = event.name
        cell.socNameLabel.text = event.societyName
        cell.photoImageView.image = event.photo
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .MediumStyle
        cell.start.text = dateFormatter.stringFromDate(event.startDate)
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let eventDetailViewController = segue.destinationViewController as! EventViewController
            
            // Get the cell that generated this segue.
            if let selectedEventCell = sender as? EventTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedEventCell)!
                let selectedEvent = events[indexPath.row]
                eventDetailViewController.event = selectedEvent
            }
        }
    }
    
}
