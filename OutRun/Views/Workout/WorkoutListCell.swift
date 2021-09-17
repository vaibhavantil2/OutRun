//
//  WorkoutListCell.swift
//
//  OutRun
//  Copyright (C) 2020 Tim Fraedrich <timfraedrich@icloud.com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

import UIKit
import MapKit
import SnapKit
import SwiftUI

class WorkoutListCell: UITableViewCell, MKMapViewDelegate, ApplicationStateObserver {
    
    var workout: Workout
    
    lazy var lineView: UIView = WorkoutLineView()
    
    let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .foregroundColor
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 4
        view.layer.borderColor = UIColor.accentColor.cgColor
        return view
    }()
    
    lazy var headerView: UIView = WorkoutListHeader(dayIdentifier: workout.dayIdentifier.value)
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .foregroundColor
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        if self.workout.isRace.value {
            view.layer.borderColor = UIColor.accentColor.withAlphaComponent(0.33).cgColor
            view.layer.borderWidth = 4
        }
        return view
    }()

    init(workout: Workout) {
        
        self.workout = workout
        
        super.init(style: .default, reuseIdentifier: nil)
        self.selectionStyle = .none
        self.backgroundColor = .backgroundColor
        
        self.addSubview(lineView)
        self.addSubview(circleView)
        self.addSubview(headerView)
        self.addSubview(cardView)
        
        let cardUI = UIHostingController(rootView: WorkoutCard())
        cardView.addSubview(cardUI.view)
        
        lineView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(18)
            make.width.equalTo(4)
        }
        circleView.snp.makeConstraints { (make) in
            make.centerY.equalTo(cardView)
            make.centerX.equalTo(lineView.snp.centerX)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        headerView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
        }
        cardView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom).offset(10)
            make.left.equalTo(lineView.snp.right).offset(18)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(100)
        }
        
        // containerView.addSubview(infoView)
        self.loadLabels()
        self.startObservingApplicationState()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    /*
    
    func loadImage() {
        let request = WorkoutMapImageRequest(workoutUUID: workout.uuid.value, size: .list) { (success, image) in
            if let image = image {
                self.mapImageView.image = image
            } else {
                self.mapImageView.isHidden = true
            }
        }
        WorkoutMapImageManager.execute(request)
    }
 */
    
    func loadLabels() {
        
        /*
        let distanceMeasurement = NSMeasurement(doubleValue: workout.distance.value, unit: UnitLength.meters)
        let distanceString = CustomMeasurementFormatting.string(forMeasurement: distanceMeasurement, type: .distance, rounding: .wholeNumbers)
        let attributedDistanceString = WorkoutListCell.attributedStringWithBigNumbers(withString: distanceString, fontSize: 36)
        self.distanceLabel.attributedText = attributedDistanceString
 */
        
    }
    
    private static func attributedStringWithBigNumbers(withString string: String, fontSize: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string.lowercased(), attributes: [.font:UIFont.systemFont(ofSize: fontSize, weight: .bold).withLowerCaseSmallCaps])
        for substring in string.components(separatedBy: " ") where NumberFormatter().number(from: substring) != nil {
            let numberRange = (string as NSString).range(of: substring, options: .numeric)
            attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: fontSize, weight: .bold), range: numberRange)
        }
        return attributedString as NSAttributedString
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if #available(iOS 13.0, *) {
            /*
            if previousTraitCollection?.hasDifferentColorAppearance(comparedTo: traitCollection) ?? false {
                self.circleView.layer.borderColor = UIColor.accentColor.cgColor
                self.mapImageView.image = nil
                self.loadImage()
                if workout.isRace.value {
                    self.containerView.layer.borderColor = UIColor.accentColor.withAlphaComponent(0.5).cgColor
                }
            }
 */
        }
    }
    
    func didUpdateApplicationState(to state: ApplicationState) {
        if state == .foreground {
            // self.loadImage()
        }
    }
    
}
