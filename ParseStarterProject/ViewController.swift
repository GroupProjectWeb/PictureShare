//Jasdeep Singh Dhadda ,Jasdeep Singh Bhadhan ,Jasjeet Kaur ,Mandeep kaur,Lovepreet Kaur
import UIKit
import Parse

class ViewController: UIViewController {
    
    var start: CGPoint?
    var x = false
    
    let imagePicker = UIImagePickerController()
    @IBOutlet var username: UITextField!
    
    @IBOutlet var errorLabel: UILabel!
    
    @IBAction func signUp(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(username.text!, password:"password") {
            
            (user: PFUser?, error: NSError?) -> Void in
            
            if let _ = error {
                
                let user = PFUser()
                user.username = self.username.text!
                user.password = "password"
                
                user.signUpInBackgroundWithBlock {
                    (succeeded, error) -> Void in
                    
                    if let error = error {
                        
                        let errorString = error.userInfo["error"]! as! String
                        
                        self.errorLabel.text = "Error: " + errorString
                        
                    } else {
                        
                        print("Signed Up")
                        self.performSegueWithIdentifier("ShowUserTable", sender: self)
                        
                    }
                    
                }
                
            } else {
                
                print("Logged In")
                self.performSegueWithIdentifier("ShowUserTable", sender: self)
            }
            
            
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBar.hidden = true
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        if PFUser.currentUser()?.username != nil {
            
            self.performSegueWithIdentifier("ShowUserTable", sender: self)
            
        }
        
    }
    
    
    
    //gallery button
    @IBAction func Gallery(sender: AnyObject) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    //gallery button
    
    
    
    //camera button
    @IBAction func openCamera(sender: AnyObject) {
        
        
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(imagePicker, animated: true, completion: nil)
       
        //camera button
        
    }
    
    //image picker function to dissmiss camera after getting picture
    func  imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    //image picker function to dissmiss camera  and photo library after getting picture
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        let touch = touches.first as UITouch!
        start = touch.locationInView(self.imageView)
        
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        
        let touch = touches.first as UITouch!
        
        let end = touch.locationInView(self.imageView)
        if let s = self.start
        {
            draw (s, end: end)
        }
        
        self.start = end
        
    }
    
    func draw(start: CGPoint, end: CGPoint)
    {
        UIGraphicsBeginImageContext(self.imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        
        imageView?.image?.drawInRect(CGRect(x:0, y:0, width: imageView.frame.width,height: imageView.frame.height))
        CGContextSetLineWidth(context, 6)
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, start.x, start.y)
        CGContextAddLineToPoint(context, end.x, end.y)
        CGContextStrokePath(context)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageView.image = newImage
        
        
    }
    
    
    
    
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "a.jpg")
        self.imageView.image = UIImage(named: "aa.png")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

