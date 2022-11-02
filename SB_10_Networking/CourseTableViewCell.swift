//
//  CourseTableViewCell.swift
//  SB_10_Networking
//
//  Created by Maxim Mitin on 2.11.22.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseNameLbl: UILabel!
    @IBOutlet weak var lessonLbl: UILabel!
    @IBOutlet weak var testsLbl: UILabel!
    
    
    func configCell(with course: Course) {
        courseNameLbl.text = course.name
        lessonLbl.text = "Number of lessons: \(course.number_of_lessons ?? 0)"
        testsLbl.text = "Number of tests: \(course.number_of_tests ?? 0)"
        
        guard let url = URL(string: course.imageUrl ?? "") else {return}

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.courseImage.image = UIImage(data: imageData)
            }
        }
    }

}
