//
//  AsalEntryViewController.swift
//  TujuApp
//
//  Created by Ulul I. on 27/10/22.
//

import UIKit
import GoogleMaps


protocol AsalEntryViewControllerDelegate: AnyObject {
    func AsalEntryViewController(_ vc: AsalEntryViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?)
}


class AsalEntryViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, GMSMapViewDelegate {
    
    weak var delegate: AsalEntryViewControllerDelegate?

    public var completion: ((String?) -> Void)?
    
    var locations = [Location]()
    
    private let asalField: UITextField = {
        let field = UITextField()
        field.placeholder = "Asal: Pilih Stasiun Asal"
        field.layer.cornerRadius = 9
        field.backgroundColor = .tertiarySystemBackground
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        
        return field
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(asalField)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .secondarySystemBackground
        asalField.delegate = self
        
        
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        asalField.frame = CGRect(x: 20, y: 30, width: view.frame.size.width-40, height: 50)
        let tableY: CGFloat = asalField.frame.origin.y+asalField.frame.size.height+5
        tableView.frame = CGRect(x: 0,
                                 y: tableY,
                                 width: view.frame.size.width,
                                 height: view.frame.size.height-tableY)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        asalField.resignFirstResponder()
        if let text = asalField.text, !text.isEmpty {
            LocationManager.shared.findLocations(with: text) { [weak self] locations in
                DispatchQueue.main.async {
                    self?.locations = locations
                    self?.tableView.reloadData()
                }
            }
        }
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = locations[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        cell.contentView.backgroundColor = .secondarySystemBackground
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Notify  map controller to show pin at selected place
        let coordinate = locations[indexPath.row].coordinates
      
        delegate?.AsalEntryViewController(self, didSelectLocationWith: coordinate)
        
        print("YOUR COORDINATE ASAL: \(coordinate.latitude), \(coordinate.longitude)")
        
        completion?(asalField.text)
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
}
