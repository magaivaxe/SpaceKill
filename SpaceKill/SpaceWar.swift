/*
  SpaceWar.swift
  SpaceKill

  Created by eleves on 17-12-04.
  Copyright © 2017 marcos. All rights reserved.
*/

import UIKit

class SpaceWar: UIViewController
{
	//------------- Outlets -------------
	@IBOutlet weak var view_mothership: UIView!
	@IBOutlet weak var view_laquais1: UIView!
	@IBOutlet weak var view_laquais2: UIView!
	@IBOutlet weak var view_normandy: UIView!
	
	@IBOutlet weak var img_mothership: UIImageView!
	@IBOutlet weak var img_laquais1: UIImageView!
	@IBOutlet weak var img_laquais2: UIImageView!
	@IBOutlet weak var img_normandy: UIImageView!
	
	@IBOutlet weak var slider_normandy: UISlider!
	//-----------------------------------
	//------------ Variables ------------
	var shotX: Float!
	var shotY: Float!
	
	//-----------------------------------
    override func viewDidLoad()
	{
        super.viewDidLoad()
		//-----
		startPlaceSpaceship(); sliderConfig(); startPlaceEnemies()
		//-----
		
		
		
		
    }
	
	//========================== Game Fonctions ===========================
	func spaceshipShot()
	{
		let view_gunShot1 = UIView(frame: CGRect(x: (CGFloat(shotX - 2.5)),	/* less half width */
												 y: CGFloat(shotY - 45),	/* less 45 pixels */
												 width: 5, height: 10))		/* View creation */
		
		let view_gunShot2 = UIView(frame: CGRect(x: (CGFloat(shotX - 2.5)),
												 y: CGFloat(shotY - 45),
												 width: 5, height: 10))
		
		view_gunShot1.backgroundColor = UIColor.white						/* color */
		
		self.view.addSubview(view_gunShot1)									/* Add to Main View the view*/
		
		
	}
	//=====================================================================
	//======================== Loading Fonctions ==========================
	func startPlaceSpaceship()
	{	/* To position in x mid frame */
		view_normandy.center.x = view.frame.width * 0.5
		/* To position in y frame proportional position */
		view_normandy.center.y = view.frame.height * 0.9017
		/* Initial var value */
		shotY = Float(view.frame.height * 0.9017)
	}
	
	func sliderConfig()
	{	/* Initial value to slider */
		slider_normandy.value = Float(view.frame.width * 0.5)
		/* Initial var value */
		shotX = slider_normandy.value
		
		if view.frame.width <= 414				/* All iPhones*/
		{
			slider_normandy.maximumValue = Float(view.frame.width - 18)
			slider_normandy.minimumValue = Float(18)
		}
		else if view.frame.width == 768			/* iPads 9.7"*/
		{
			slider_normandy.maximumValue = Float(view.frame.width - 40)
			slider_normandy.minimumValue = Float(40)
		}
		else if view.frame.width == 834			/* iPads 10.5"*/
		{
			slider_normandy.maximumValue = Float(view.frame.width - 44)
			slider_normandy.minimumValue = Float(44)
		}
		else if view.frame.width == 1024		/* iPads 12.9"*/
		{
			slider_normandy.maximumValue = Float(view.frame.width - 54)
			slider_normandy.minimumValue = Float(54)
		}
		
	}
	func startPlaceEnemies()
	{
		
	}
	//=====================================================================
	@IBAction func shifting_normandy(_ sender: UISlider)
	{
		shotX = sender.value
		view_normandy.center.x = CGFloat(shotX)
		
		spaceshipShot()
	}
	
}


















