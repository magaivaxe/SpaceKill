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
	func createLackeys(numberOfLackeys nl: Int,
					   lackeysByLine lb: Int,
					   screenWidthSize sws: CGFloat,
					   screemHeightSize shs: CGFloat) -> [UIView]
	{
		var arrayToReturn = [UIView]()
		var aUIView: UIView!
		var aUIImgView: UIImageView!
		
		for i in 1...nl
		{
			//-- Line 1 -- 0.065 = 50/768 width ipad 9.7"
			if i <= lb
			{
				aUIView = UIView(frame: .init(x: 0, y: 0,
											  width: sws * 0.0651, height: sws * 0.0651))

				aUIImgView = UIImageView(frame: .init(x: 0, y: 0,
													  width: sws * 0.065, height: sws * 0.065))
			}
			//-- Line 2 --
			if (i > lb && i <= lb * 2)
			{
				aUIView = UIView(frame: .init(x: 0, y: 0,
											  width: sws * 0.0651, height: sws * 0.0651))
				
				aUIImgView = UIImageView(frame: .init(x: 0, y: 0,
													  width: sws * 0.0651, height: sws * 0.0651))
			}
			//-- Line 3 --
			if (i > lb * 2 && i <= lb * 3)
			{
				aUIView = UIView(frame: .init(x: 0, y: 0,
											  width: sws * 0.0651, height: sws * 0.0651))
				
				aUIImgView = UIImageView(frame: .init(x: 0, y: 0,
													  width: sws * 0.0651, height: sws * 0.0651))
			}
			//-- Line 4 --
			if (i > lb * 3 && i <= nl)
			{
				aUIView = UIView(frame: .init(x: 0, y: 0,
											  width: sws * 0.0651, height: sws * 0.0651))
				
				aUIImgView = UIImageView(frame: .init(x: 0, y: 0,
													  width: sws * 0.0651, height: sws * 0.0651))
			}
			aUIView.addSubview(aUIImgView)
			
			arrayToReturn.append(aUIView)
			
		}
		return arrayToReturn
	}
}

