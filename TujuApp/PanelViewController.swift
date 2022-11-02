//
//  PanelViewController.swift
//  TujuApp
//
//  Created by Ulul I. on 27/10/22.
//

import UIKit
import FloatingPanel
import GoogleMaps

protocol PanelViewControllerDelegate: AnyObject {
    func PanelViewController(_ vc: PanelViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?)
}

class PanelViewController: UIViewController, UITextFieldDelegate, AsalEntryViewControllerDelegate {
    
    let panel = FloatingPanelController()
    
    weak var delegate: PanelViewControllerDelegate?
    
    var locations = [Location]()
    
    let mapView = GMSMapView(frame: .zero)
    
    var asalField: UITextField = {
        let field = UITextField()
        field.placeholder = "Asal: Pilih Stasiun Asal"
        field.layer.cornerRadius = 9
        field.backgroundColor = .tertiarySystemBackground
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        
        return field
    }()
    
    var tujuanField: UITextField = {
        let field = UITextField()
        field.placeholder = "Tujuan: Pilih Stasiun Tujuan"
        field.layer.cornerRadius = 9
        field.backgroundColor = .tertiarySystemBackground
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        
        return field
    }()
    
    
    let startBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 20
        button.setTitle("Mulai Perjalanan", for: .normal)
        button.addTarget(AsalEntryViewController.self, action: #selector(didTapMulai), for: .touchUpInside)
        
        return button
    }()
    
    private let label: UILabel = {
        let attachment = NSTextAttachment()
        attachment.image = UIImage(systemName: "info.circle.fill")
        let imageString = NSMutableAttributedString(attachment: attachment)
        let textString = NSAttributedString(string: " Mulai perjalanan saat berada di stasiun awal")
        imageString.append(textString)
        let label = UILabel()
        label.attributedText = imageString
        label.font = .systemFont(ofSize: 14, weight: .ultraLight)
        
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        //Asal
        view.addSubview(asalField)
        asalField.addTarget(self, action: #selector(didTapAsal), for: .touchUpInside)
        asalField.delegate = self
    
        //Tujuan
        view.addSubview(tujuanField)
        tujuanField.addTarget(self, action: #selector(didTapTujuan), for: .touchUpInside)
        tujuanField.delegate = self
    
        
        view.addSubview(label)
        view.addSubview(startBtn)

        let asalVC = TujuApp.AsalEntryViewController()
        asalVC.delegate = self
        
//        panel.set(contentViewController: asalVC)
//        panel.addPanel(toParent: self)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
        asalField.frame = CGRect(x: 20, y: 30, width: view.frame.size.width-40, height: 50)
        tujuanField.frame = CGRect(x: 20, y: 40+asalField.frame.size.height, width: view.frame.size.width-40, height: 50)

        label.sizeToFit()
        label.frame = CGRect(x: 25, y: 120+tujuanField.frame.size.height, width: label.frame.size.width, height: label.frame.size.height)
        startBtn.frame = CGRect(x: 20, y: 180+label.frame.size.height, width: view.frame.size.width-40, height: 50)
        mapView.frame = view.bounds
    }
    
    @objc private func didTapMulai() {
        // Draw the direction
        panel.move(to: .tip, animated: true)
    }
    
    @objc private func didTapAsal() {
        let asalEntry = TujuApp.AsalEntryViewController()
        asalEntry.completion = { [weak self] text in
            DispatchQueue.main.async {
                self?.asalField.text = text
            }
        }
        let vc = UINavigationController(rootViewController: asalEntry)
        present(vc, animated: true)
    }
    
    @objc private func didTapTujuan() {
        let tujuanEntry = TujuApp.TujuanEntryViewController()
        tujuanEntry.completion = { [weak self] text in
            DispatchQueue.main.async {
                self?.tujuanField.text = text
            }
        }
        let vc = UINavigationController(rootViewController: tujuanEntry)
        present(vc, animated: true)
    }
    
    func AsalEntryViewController(_ vc: AsalEntryViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?) {
        
        guard let coordinates = coordinates else {
            return
        }
        
        panel.move(to: .half, animated: true)
        
        print("PANEL: \(coordinates.latitude), \(coordinates.longitude)")
        
      let camera = GMSCameraPosition.camera(withLatitude: coordinates.latitude, longitude: coordinates.longitude, zoom: 16.0)
        mapView.animate(toLocation: coordinates)
        mapView.camera = camera
        mapView.animate(to: camera)
        
    }
    
//    func TujuanEntryViewController(_ vc: TujuanEntryViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?) {
//
//        guard let coordinates = coordinates else {
//            return
//        }
//
//        // Hide panel
////        panel.move(to: .tip, animated: true)
//
//        // Coordinates
//        let pondokRanji: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
//
//        // Set Initial Camera Position
//        let pondokRanjiCam = GMSCameraUpdate.setTarget(
//            pondokRanji
//        )
//
//        let mapView = GMSMapView(frame: self.view.bounds)
//
//        mapView.animate(with: pondokRanjiCam)
//
//    }

}
