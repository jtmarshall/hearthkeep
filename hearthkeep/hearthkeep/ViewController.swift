//
//  ViewController.swift
//  hearthkeep
//
//  Created by Jordan  on 3/31/17.
//  Copyright © 2017 Jordan . All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var grabImageButton: UIButton!
    
    // MARK: Actions
    
    @IBAction func grabNewImage(_ sender: AnyObject) {
        setUIEnabled(false)
        getImageFromFlickr()
    }
    
    // MARK: Configure UI
    
    private func setUIEnabled(_ enabled: Bool) {
        photoTitleLabel.isEnabled = enabled
        grabImageButton.isEnabled = enabled
        
        if enabled {
            grabImageButton.alpha = 1.0
        } else {
            grabImageButton.alpha = 0.5
        }
    }
    
    // MARK: Make Network Request
    
    private func getImageFromFlickr() {
        
        let methodParameters = [
            // Constants.HSParameterKeys.Method: Constants.HSParameterValues.GETMethod,
            Constants.HSParameterKeys.APIKey: Constants.HSParameterValues.APIKey,
            Constants.HSParameterKeys.Format: Constants.HSParameterValues.ResponseFormat
        ]
        
        let session = URLSession.shared
        let urlString = Constants.Hearthstone.APIBaseURL //+ escapedParameters(methodParameters as [String:AnyObject])
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        // Set Mashape API key
        request.setValue(Constants.HSParameterValues.APIKey, forHTTPHeaderField: "X-Mashape-Key")
        print(request)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            // if an error occurs, print it and re-enable the UI
            func displayError(_ error: String) {
                print(error)
                print("URL at time of error: \(url)")
                performUIUpdatesOnMain {
                    self.setUIEnabled(true)
                }
            }
            
            // no error, woohoo!
            if error == nil {
                
                // there was data returned
                if let data = data {
                    
                    let parsedResult: [String:AnyObject]!
                    do {
                        parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
                        print("count",parsedResult.count)
                    } catch {
                        displayError("Could not parse the data as JSON: '\(data)'")
                        return
                    }
                    let parsedHearthstoneJSON = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSDictionary
                    
                    // Basic Cards
                    guard let arrayOfBasics = parsedHearthstoneJSON["Basic"] as? [[String:AnyObject]] else {
                        print("Cannot find key 'Basic' in \(parsedHearthstoneJSON)")
                        return
                    }
                    // Card Backs
                    guard let arrayOfCardSkins = parsedHearthstoneJSON["Hero Skins"] as? [[String:AnyObject]] else {
                        print("Cannot find key 'Basic' in \(parsedHearthstoneJSON)")
                        return
                    }
                    
//                    let randomPhotoIndex = Int(arc4random_uniform(UInt32(arrayOfBasics.count)))
//                    let randomImg = arrayOfBasics[randomPhotoIndex] as [String:AnyObject]
//                    print(randomImg["img"])
                    for card in arrayOfBasics {
                        guard let cardName = card[Constants.HSResponseKeys.Name] as? String else {
                            return
                        }
                        print(cardName)
                    }
                    
                    let randomPhotoIndex = Int(arc4random_uniform(UInt32(arrayOfBasics.count)))
                    //_ = photoArray[randomPhotoIndex] as [String:AnyObject]
                    
                    let randomImg = arrayOfBasics[randomPhotoIndex] as [String:AnyObject]
                    print(randomImg["img"]!)
                    
                    if let imageUrlString = randomImg[Constants.HSResponseKeys.Image] as? String,
                        let photoTitle = randomImg[Constants.HSResponseKeys.Name] as? String {
                        
                        let imageURL = URL(string: imageUrlString)
                        if let imageData = try? Data(contentsOf: imageURL!) {
                            performUIUpdatesOnMain {
                                self.photoImageView.image = UIImage(data: imageData)
                                self.photoTitleLabel.text = photoTitle
                                self.setUIEnabled(true)
                            }
                        }
                    }
                    
                }
            }
        }
        
        // start the task!
        task.resume()
        
    }
    
    // Use to plug in search criteria for API
    private func escapedParameters(_ parameters: [String:AnyObject]) -> String {
        
        if parameters.isEmpty {
            return ""
        } else {
            var keyValuePairs = [String]()
            
            for (key, value) in parameters {
                
                // make sure that it is a string value
                let stringValue = "\(value)"
                
                // escape it
                let escapedValue = stringValue.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                
                // append it
                keyValuePairs.append(key + "=" + "\(escapedValue!)")
                
            }
            
            return "?\(keyValuePairs.joined(separator: "&"))"
        }
    }
    
}
