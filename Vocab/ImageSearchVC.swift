//
//  ImageSearchVC.swift
//  Vocab
//
//  Created by Basile Raynaud on 2/13/18.
//  Copyright © 2018 Basile Raynaud. All rights reserved.
//

import UIKit

class ImageSearchVC: UIViewController, UITextFieldDelegate {

	@IBOutlet var searchTextField: UITextField!
	@IBOutlet var searchImageView: UIImageView!
	
	@IBAction func previousImage(_ sender: Any) {
		if(imageSelected>0){
			imageSelected=imageSelected-1
			loadImage()
		}
	}
	
	@IBAction func nextImage(_ sender: Any) {
		if(imageSelected<2){
			print(imageSelected)
			imageSelected+=1
			loadImage()
		}
	}
	
	var imageSelected = 1
	var data = [:] as! [String:Any]
	
	@IBAction func back(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")
        self.searchTextField.delegate = self;
        searchTextField.text = filteredList[selectedIndex]
		
        // Do any additional setup after loading the view.
		searchImage(word: filteredList[selectedIndex])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    func loadImage(){
    let sv = UIViewController.displaySpinner(onView: self.view)
	for(key, value) in self.data {
			//print(key)
			if(key == "items"){
				let valueArray = value as! NSArray
				//print(items[0])
				let items = valueArray[imageSelected] as! [String:Any]
				for(key,value) in items {
					//print(key)
					if(key == "link"){
						print(value)
						//let url:URL = URL(string: value as! String)!
						
						URLSession.shared.dataTask(with: NSURL(string: value as! String)! as URL,completionHandler: { (data, response, error) -> Void in

							if error != nil {
								print(error)
								UIViewController.removeSpinner(spinner: sv)
								return
							}
							DispatchQueue.main.async(execute: { () -> Void in
								let image = UIImage(data: data!)
								self.searchImageView.image = image
							})
							UIViewController.removeSpinner(spinner: sv)

						}).resume()
					}
				}
			}
		}
    }
	
    func searchImage(word: String) {
		let searchKey = "010024666010139195210:p8gvjci2z9u"
        let apiKey = "AIzaSyD8elseKO8P1xFBXHc_cR1z71FLtrwsaCg"

		let urlString = "https://www.googleapis.com/customsearch/v1?key="+apiKey+"&cx="+searchKey+"&q="+word+"&searchType=image&num=3"
		let sv = UIViewController.displaySpinner(onView: self.view)
		
		guard let url = URL(string: urlString) else { return }
		
		//request.httpMethod = "GET"
		//let config = URLSessionConfiguration.default
		//let session = URLSession(configuration: config)
		URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                UIViewController.removeSpinner(spinner: sv)
            }
			
            if let dat = try? JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]{
				self.data = dat
			}
			
			self.imageSelected = 0
			self.loadImage()
			
			
			//print(dat)
			
			//let items = dat!["items"] as? [String:Any]
			
			
		UIViewController.removeSpinner(spinner: sv)
        }.resume()
		
    }
	
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchTextField {
			if(textField.text != nil || textField.text != ""){
				searchImage(word: textField.text!)
				textField.resignFirstResponder()
				return false
            }
        }
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIViewController {
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
 
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }   
}

