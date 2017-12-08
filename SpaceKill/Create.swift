//
//  CreateLackeys.swift
//  SpaceKill
//
//  Created by eleves on 17-12-07.
//  Copyright © 2017 marcos. All rights reserved.
//

import Foundation
import UIKit

class Create
{
	var arrayToReturn = [AnyObject]()
	var aUIView: UIView!
	var aUIImgView: UIImageView!
	
	
	func createArrayOfLackeys(numberOfLackeys nl: Int,
							  lackeysByLine lb: Int,
							  screenWidthSize sws: CGFloat,
							  screemHeightSize shs: CGFloat,
							  distanceViewsX dvx: CGFloat,
							  distanceViewsY dvy: CGFloat) -> [UIView]
	{
		let constIncrementationX: CGFloat = dvx / sws
		let constIncrementationY: CGFloat = dvy / shs
		var incX: CGFloat = 0
		var incY: CGFloat = 0
		
		for i in 1...nl
		{
			//-- Line 1 -- 0.0651 = 50/768 width ipad 9.7" // 0.141927 = 109/768 // 0.152344 = 156/1024
			if i <= lb
			{
				aUIView = UIView(frame: .init(x: sws * (109/768 + incX),
											  y: shs * (156/1024 + incY),
											  width: sws * 50/768,
											  height: shs * 50/1024))
			}
			//-- Line 2 --
			if (i > lb && i <= lb * 2)
			{
				if i == (lb + 1) { incX = 0 } // Reset incX on line 2
				
				aUIView = UIView(frame: .init(x: sws * (109/768 + incX),
											  y: shs * (156/1024 + incY),
											  width: sws * 50/768,
											  height: shs * 50/1024))
			}
			//-- Line 3 --
			if (i > lb * 2 && i <= lb * 3)
			{
				if i == (2 * lb + 1) { incX = 0 } // Reset incX on line 3
				
				aUIView = UIView(frame: .init(x: sws * (109/768 + incX),
											  y: shs * (156/1024 + incY),
											  width: sws * 50/768,
											  height: shs * 50/1024))
			}
			//-- Line 4 --
			if (i > lb * 3 && i <= nl)
			{
				if i == (3 * lb + 1) { incX = 0 } // Reset incX on line 3
				
				aUIView = UIView(frame: .init(x: sws * (109/768 + incX),
											  y: shs * (156/1024 + incY),
											  width: sws * 50/768,
											  height: shs * 50/1024))
			}
			
			arrayToReturn.append(aUIView)
			//-- X incrementations
			incX = incX + constIncrementationX
			//-- Y incrementations conditions
			if (i == lb || i == 2 * lb || i == 3 * lb)
			{ incY = incY + constIncrementationY }
		}
		return arrayToReturn as! [UIView]
	}
	
	func createArrayOfImgViewsLackeys(numberOfImgLackeys nl: Int,
									  screenWidthSize sws: CGFloat,
									  screemHeightSize shs: CGFloat) -> [UIImageView]
	{
		for _ in 1...nl
		{
			aUIImgView = UIImageView(frame: .init(x: 0,
												  y: 0,
												  width: sws * 50/768,
												  height: shs * 50/1024))
			
			aUIImgView.image = UIImage(named: "lackey.png")
			arrayToReturn.append(aUIImgView)
			
		}
		return arrayToReturn as! [UIImageView]
	}
}


























