//
//  SecondViewController.swift
//  Vocab
//
//  Created by Basile Raynaud on 1/6/18.
//  Copyright © 2018 Basile Raynaud. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController, UITextViewDelegate {

	@IBOutlet var word: UILabel!
	@IBOutlet var definition: UITextView!
	@IBOutlet var showHideButton: UIButton!
	
	var showing = false;
	let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
	
	@IBAction func readAloud(_ sender: Any) {
		myUtterance = AVSpeechUtterance(string: word.text!)
        myUtterance.rate = 0.5
		synth.speak(myUtterance)
		//print(word.text!)
	}
	
	@IBAction func findImage(_ sender: Any) {
		performSegue(withIdentifier: "imageSegue", sender: self)
	}
	
	
	@IBAction func randomize(_ sender: Any) {
		filteredList = list
		selectedIndex = Int(arc4random_uniform(UInt32(filteredList.count)))
		showHideButton.setTitle("show", for: .normal)
		definition.text = ""
		showing = false
		word.text = filteredList[selectedIndex]
	}
	
	func loadWord(key: String){
		print(key)
		filteredList = list
		if (filteredList.contains(key)){
			selectedIndex = filteredList.index(of: key)!
			showHideButton.setTitle("show", for: .normal)
			definition.text = ""
			showing = false
			word.text = filteredList[selectedIndex]
		} else {
			print("word not found")
		}
	}
	
	@IBAction func showHide(_ sender: Any) {
		if showing {
			showHideButton.setTitle("show", for: .normal)
			definition.text = ""
			showing = false
		} else {
			if let def = dictionary[filteredList[selectedIndex]] {
				showHideButton.setTitle("hide", for: .normal)
				//definition.text = def
				findLinks()
				showing = true
			}
		}
	}
	
	func findLinks(){
		if let def = dictionary[filteredList[selectedIndex]] {
			
			let myAttribute = [ NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular) ]
			let attributedString = NSMutableAttributedString(string: def, attributes: myAttribute)
			
			let words = def.split(separator: " ")

			for word in words {
				var key=word.trimmingCharacters(in: NSCharacterSet.punctuationCharacters)
				//print(key.capitalized)
				//print(filteredList.contains(key.capitalized))
				if list.contains(key.capitalized) {
					attributedString.addAttribute(.link, value: "https://www."+key.capitalized+".com", range: NSRange(location: word.startIndex.encodedOffset, length: word.count))
					//attributedString.addAttribute(.link, value: loadWord(key: key.capitalized), range: NSRange(location: word.startIndex.encodedOffset, length: word.count))
					//attributedString.addAttribute(.link, value: "", range: NSRange(location: word.startIndex.encodedOffset, length: word.count))
					//print("found")
				}
			}
			
			definition.attributedText = attributedString

			
		}
		
	}
	
	func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        //UIApplication.shared.open(URL, options: [:])
        var s = URL.absoluteString
        s = s.replacingOccurrences(of: "https://www.", with: "")
		s = s.replacingOccurrences(of: ".com", with: "")
		//print(s)
		loadWord(key: s)
        return false
    }
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		word.text = filteredList[selectedIndex]
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}


