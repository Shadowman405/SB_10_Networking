//
//  CoursesTableViewController.swift
//  SB_10_Networking
//
//  Created by Maxim Mitin on 2.11.22.
//

import UIKit

class CoursesTableViewController: UITableViewController {
    
    private var courses: [Course] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CourseTableViewCell
        let course = courses[indexPath.row]
        cell.configCell(with: course)

        return cell
    }

}


extension CoursesTableViewController {
    func fetchCourse() {
        guard let url = URL(string: URLExamples.exampleTwo.rawValue) else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "error")
                return
            }
        
            do {
                let decoder = JSONDecoder()
                self.courses = try decoder.decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
