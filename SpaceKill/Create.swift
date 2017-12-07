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
	func createLackeys(numberOfLackeys nl: Int, screenWidthSize sws: CGFloat, screemHeightSize shs: CGFloat) -> [UIView]
	{
		for _ in 1...nl
		{
			let lackeyUIView = UIView(frame: .init(x: <#T##CGFloat#>,
												   y: <#T##CGFloat#>,
												   width: sws * 0.065,		//0.065 = 50/768 width ipad 9.7"
												   height: sws * 0.065))

			let lackeyUIImageView = UIImageView(frame: .init(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))


		}
	}
}

