//
//  Animation.swift
//  SpaceKill
//
//  Created by eleves on 17-12-06.
//  Copyright © 2017 marcos. All rights reserved.
//

import Foundation
import UIKit

class Animation
{
	var animationTimer: Timer!		/* Variable of time animation */
	var class_maxDistance: Int!		/* Internal max distance */
	var distance = 0				/* Incremental distance */
	var bulletPossition: CGFloat!	/* Real bullet position */
	
	func animateShot(_ arrayGunShots: [UIView],
					 _ timeInterval: Double,
					 _ bulletInitialPosition: CGFloat,
					 _ maxAnimationDistance: Int)
	{	/* Distace for shot animation */
		class_maxDistance = maxAnimationDistance
		/* Animation timer execution */
		animationTimer = Timer.scheduledTimer(timeInterval: timeInterval,
											  target: self,
											  selector: #selector(animation),
											  userInfo: nil,
											  repeats: true)
	}
	
	@objc func animation()
	{	/* distance incremental */
		distance = distance + 1
		
		if distance >= class_maxDistance { animationTimer.invalidate(); animationTimer = nil }
		
		
	}
	
	
}
