//
//  MainCollectionViewController.swift
//  SB_10_Networking
//
//  Created by Maxim Mitin on 1.11.22.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainCollectionViewController: UICollectionViewController {
    
    private let userAction = UserActions.allCases

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userAction.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserActionCell", for: indexPath) as! UserActionCell
        cell.userActionLbl.text = userAction[indexPath.item].rawValue
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = userAction[indexPath.item]
        
        switch action {
            case .downloadImgae: performSegue(withIdentifier: "showImage", sender: nil)
            case .exampleOne: exampleOnePressed()
            case .exampleTwo: exampleTwoPressed()
            case .exampleThree: exampleThreePressed()
            case .exampleFour: exampleFourPressed()
            case .ourCourses: performSegue(withIdentifier: "showCourses", sender: nil)
        }
    }

}

// MARK: - Extinsions

extension MainCollectionViewController {
    
    enum URLExamples: String {
        case imageURL = "https://m.media-amazon.com/images/M/MV5BNjQ1NDk2Njk4Ml5BMl5BanBnXkFtZTgwNjMzNDk0MDI@._V1_.jpg"
        case exampleOne = "https://swiftbook.ru//wp-content/uploads/api/api_course"
        case exampleTwo = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
        case exampleThree = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"
        case exampleFour = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"
    }
    
    
    enum UserActions: String, CaseIterable {
        case downloadImgae = "Download Image"
        case exampleOne = "Example One"
        case exampleTwo = "Example Two"
        case exampleThree = "Example Three"
        case exampleFour = "Example Four"
        case ourCourses = "Our Courses"
    }
    
// MARK: - Alert Controllers
    
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Success",
                                          message: "You can see results in debug console",
                                          preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Failed",
                                          message: "Error , ,essage recieved to console",
                                          preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
 // MARK: - Networking
    
    private func exampleOnePressed() {
        
    }
    
    
    private func exampleTwoPressed() {
        
    }
    
    
    private func exampleThreePressed() {
        
    }
    
    
    private func exampleFourPressed() {
        
    }
    
}


extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48 , height: 100)
    }
}
