import UIKit
import Foundation

class EventTableViewController: UITableViewController, UIDocumentInteractionControllerDelegate {
    // MARK: Properties
    var events = [Event]()
    var filePath: NSURL!
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentDirectoryPath:String = path[0]
        filePath = NSURL(fileURLWithPath: documentDirectoryPath.stringByAppendingString("/getEvents.json"))
        
        let url = NSURL(string: "http://clontarfguitarlessons.com/getEvents.php")!
        let urlData = NSData(contentsOfURL:url);
        if (( urlData ) != nil)
        {
            print("loaded from URL")
            if (urlData!.writeToURL(filePath, atomically: true) == true)
            {
                print("writing Succeded")
            }
        }
        loadEvents()
    }
    
    func loadEvents() {
        
        let data = NSData(contentsOfURL: filePath)! //Data is from the file
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            
//--------------------------------JSON PARSING------------------------------------
            if let result = json["result"] as? [[String: AnyObject]] {
                for entry in result {
                    let decodedData = NSData(base64EncodedString: entry["Low Res"] as! String, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters) //get get the imagedata from the string (should store as a byte arrray?)
                    
                    let decodedImage = UIImage(data: decodedData!) //convert that data into an image we can use
                    
                    let event = Event(name: entry["Society Name"] as! String,photo: decodedImage)   //create an event with the society and Image of that JSON entry
                    events += [event!] //add it to the array of events
                    }
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
//---------------------------------------------------------------------------------
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

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
        cell.photoImageView.image = event.photo
        
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            events.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
    

    @IBAction func unwindToEventList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? EventViewController, event = sourceViewController.event {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing event.
                events[selectedIndexPath.row] = event
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
                // Add a new event.
                let newIndexPath = NSIndexPath(forRow: events.count, inSection: 0)
                events.append(event)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
    }
}
