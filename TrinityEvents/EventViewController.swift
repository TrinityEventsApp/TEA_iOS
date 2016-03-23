import UIKit

class EventViewController: UIViewController, UINavigationControllerDelegate {
    // MARK: Properties
    
    //@IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
//    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var scrollView: UIScrollView!
//    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var myView: UIView!
    /*
        This value is either passed by `EventTableViewController` in `prepareForSegue(_:sender:)`
        or constructed as part of adding a new event.
    */
    var event: Event?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up views if editing an existing Event.
        if let event = event {
            navigationItem.title = event.societyName
//            nameTextField.text   = event.name
            eventName.text           = event.name
            eventDescription.text           = event.eventDescription
            photoImageView.image = event.photo
            print(event.eventDescription)
            //ratingControl.rating = event.rating
        }
        //stackView.sizeToFit()
        //scrollView.sizeToFit()
       // myView.sizeToFit()
        //let size = stackView.intrinsicContentSize()
    //    scrollView.contentSize = size
        // setup scrollview
        //let insets = UIEdgeInsetsMake(0.0, 0.0, 10.0, 0.0)
        //scrollView.contentInset = insets
        //scrollView.scrollIndicatorInsets = insets
        
        //scrollView.setContentOffset(CGPointMake(0,scrollView.contentOffset.y),animated: true);
        //scrollView.directionalLockEnabled = true
        
        // Handle the text field’s user input through delegate callbacks.
        //nameTextField.delegate = self
        
    }
    // MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddEventMode = presentingViewController is UINavigationController
        
        if isPresentingInAddEventMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
    
}

