

import UIKit
import CoreData


class vcMain: UIViewController {
    @IBOutlet var textUsername: UITextField!
    @IBOutlet var textPassword: UITextField!
   
    @IBAction func btnSave(){
       // println("Save Botton Pressed \(textUsername.text)")
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
    
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
        
        newUser.setValue("" + textUsername.text, forKey: "username")
        newUser.setValue("" + textPassword.text, forKey: "password")
        

        context.save(nil)
        println(newUser)
        println("Object Save.")
        
        
        
        
    }
    
    @IBAction func btnLoad(){
       //  println("Load Botton Pressed \(textPassword.text)")
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!

        
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false;
        
        request.predicate = NSPredicate(format: "username = #@", "" + textUsername.text)
        
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        
        if (results.count > 0){
           var res = results[0] as! NSManagedObjectContext
            textUsername.text = res.valueForKey("username") as! String
            textPassword.text = res.valueForKey("password") as! String
            // for res in results {
           // println(res)
           // }
        
        }else {
            println("0 Result Return..... Potencial Error")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
