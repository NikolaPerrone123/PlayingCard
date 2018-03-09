//
//  CarsViewController.swift
//  PlayingCard
//
//  Created by Nikola Popovic on 3/9/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit

class CarsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    private let oldtimerHeaderIdentifier = "oldtimerIdentifier"
    private let cellHeaderIdentifier = "cellHeaderIdentifier"
    private let cellSingleCarIdentifier = "SingleCarTableViewCell"
    private let cellTwoCarsIdentifier = "TwoCarsTableViewCell"
    
    private var listOfCars = [CarModel]()
    private let images = [#imageLiteral(resourceName: "aston-martin"),#imageLiteral(resourceName: "ferrari-288"),#imageLiteral(resourceName: "lexus-is-f"),#imageLiteral(resourceName: "mclaren"),#imageLiteral(resourceName: "mercedes-amg-gts"),#imageLiteral(resourceName: "mercedes"),#imageLiteral(resourceName: "porsche-911-turbo"),#imageLiteral(resourceName: "porsche-carrera-gt")]
    private let titlse = ["Aston Martin", "Ferrari 288", "Lexsus Is F", "McLaren", "Mercedes GTS AMG", "Mercedes interior", "Porsche 911 Turbo", "Porsche GT"]
    private let headerTitle = ["Your last search", "What are you looking for?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filloutModel()
        setTable()
    }
    
    private func filloutModel(){
        for index in images.indices {
            let car = CarModel()
            car.image = images[index]
            car.title = titlse[index]
            listOfCars.append(car)
        }
    }
    
    private func setTable(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let nibHeader = UINib.init(nibName: "CarHeaderTableViewCell", bundle: Bundle.main)
        let nibOldTimerCar = UINib.init(nibName: "OldTimerTableViewCell", bundle: Bundle.main)
        let nibSingleCar = UINib.init(nibName: cellSingleCarIdentifier, bundle: Bundle.main)
        let nibTwoCar = UINib.init(nibName: cellTwoCarsIdentifier, bundle: Bundle.main)
        self.tableView.register(nibHeader, forCellReuseIdentifier: cellHeaderIdentifier)
        self.tableView.register(nibOldTimerCar, forCellReuseIdentifier: oldtimerHeaderIdentifier)
        self.tableView.register(nibSingleCar, forCellReuseIdentifier: cellSingleCarIdentifier)
        self.tableView.register(nibTwoCar, forCellReuseIdentifier: cellTwoCarsIdentifier)
        self.tableView.estimatedRowHeight = 300
    }
}

extension CarsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return listOfCars.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            cell = setCellForFirstSection(indexPath: indexPath, tableView: tableView)
        case 1:
            cell = setCellForSecondSection(indexPath : indexPath, tableView : tableView)
        default:
            break
        }
        return cell
    }
    
    func setCellForFirstSection(indexPath : IndexPath, tableView : UITableView) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellHeaderIdentifier, for: indexPath) as! CarHeaderTableViewCell
            cell.titleText.text = headerTitle[0]
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: oldtimerHeaderIdentifier, for: indexPath) as! OldTimerTableViewCell
            cell.carImage.image = images[indexPath.row]
            cell.titileText.text = titlse[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func setCellForSecondSection(indexPath : IndexPath, tableView : UITableView) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellHeaderIdentifier, for: indexPath) as! CarHeaderTableViewCell
            cell.titleText.text = headerTitle[1]
            return cell
        default:
            if indexPath.row % 2 == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellTwoCarsIdentifier, for: indexPath) as! TwoCarsTableViewCell
                cell.firstCarImage.image = images[indexPath.row]
                cell.secondCarImage.image = images[indexPath.row]
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellSingleCarIdentifier, for: indexPath) as! SingleCarTableViewCell
                cell.carImage.image = images[indexPath.row]
                return cell
            }
        }
    }
}

extension CarsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
