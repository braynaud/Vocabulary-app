//
//  FirstViewController.swift
//  Vocab
//
//  Created by Basile Raynaud on 1/6/18.
//  Copyright © 2018 Basile Raynaud. All rights reserved.
//

import UIKit

var selectedIndex = 0;


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

	@IBOutlet var searchSwitch: UISwitch!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var searchBar: UISearchBar!
	var searching = false
	
	@IBAction func switched(_ sender: Any) {
		search()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		searchBar.delegate = self
		self.tableView.keyboardDismissMode = .interactive
		//let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
		//view.addGestureRecognizer(tap)
	}
	
	func dismissKeyboard() {
    //Causes the view (or one of its embedded text fields) to resign the first responder status.
    view.endEditing(true)
}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if searching {
			return filteredList.count
		} else {
			return filteredList.count
		}
	}
	
	public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		selectedIndex = indexPath.row
		performSegue(withIdentifier: "detailSegue", sender: self)
	}
	 

    
	
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
		if searching {
			cell.textLabel?.text = filteredList[indexPath.row]
		} else {
			cell.textLabel?.text = filteredList[indexPath.row]
		}
		
		return cell
	}
	
	func search() {
		if searchBar.text == nil || searchBar.text == "" {
			searching = false
			//view.endEditing(true)
			filteredList = list
			tableView.reloadData()
		} else {
			searching = true
			let text = searchBar.text
			if searchSwitch.isOn {
				//print("on")
				let filtered=dictionary.filter({$0.value.localizedCaseInsensitiveContains(text!)})
				filteredList = Array(filtered.keys).sorted()
				tableView.reloadData()
			} else {
				//filteredList = list.filter({$0.localizedCaseInsensitiveContains(text!)})
				filteredList = list.filter({$0.localizedCaseInsensitiveContains(text!)})
				tableView.reloadData()
			}
		}
	}
	
	func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()//self.searchBar?.endEditing(true)
    }
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		/*if searchBar.text == nil || searchBar.text == "" {
			searching = false
			//view.endEditing(true)
			filteredList = list
			tableView.reloadData()
		} else {
			search()
		}*/
		search()
	}
	

	





}

