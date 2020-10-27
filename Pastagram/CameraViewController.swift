//
//  CameraViewController.swift
//  Pastagram
//
//  Created by Noor Ali on 10/26/20.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate,
                            UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    
   
    @IBOutlet weak var commentField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true // presents second screen to the user before they finish
        
            // to avoid crash check if camera is available
        // this is an swift enum
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera // use phone camera
            
        }
        else{ // when using simulator
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let  image = info[.editedImage] as! UIImage // get the message
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil) // dismis the camera
        
        
    }
    @IBAction func onSubmitButton(_ sender: Any) {
        let post  = PFObject(className: "Posts")
        post["caption"] = commentField.text!
        post["author"] = PFUser.current()!

        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!) // unwrapp
        post["image"] = file
        
        post.saveInBackground{(success, error) in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("Saved")
            }
            else {
                print("error")
            }
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
