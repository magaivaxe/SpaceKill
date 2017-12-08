/*
  SpaceWar.swift
  SpaceKill

  Created by eleves on 17-12-04.
  Copyright © 2017 marcos. All rights reserved.
*/

import UIKit
import Foundation

class SpaceWar: UIViewController
{
	//------------- Outlets -------------
	@IBOutlet weak var view_lackey1: UIView!
	@IBOutlet weak var view_lackey2: UIView!
	@IBOutlet weak var view_lackey3: UIView!
	@IBOutlet weak var view_lackey4: UIView!
	@IBOutlet weak var view_lackey5: UIView!
	@IBOutlet weak var view_lackey6: UIView!
	@IBOutlet weak var view_lackey7: UIView!
	@IBOutlet weak var view_lackey8: UIView!
	@IBOutlet weak var view_lackey9: UIView!
	@IBOutlet weak var view_lackey10: UIView!
	@IBOutlet weak var view_lackey11: UIView!
	@IBOutlet weak var view_lackey12: UIView!
	@IBOutlet weak var view_lackey13: UIView!
	@IBOutlet weak var view_lackey14: UIView!
	@IBOutlet weak var view_lackey15: UIView!
	@IBOutlet weak var view_lackey16: UIView!
	@IBOutlet weak var view_lackey17: UIView!
	@IBOutlet weak var view_lackey18: UIView!
	@IBOutlet weak var view_lackey19: UIView!
	@IBOutlet weak var view_lackey20: UIView!
	@IBOutlet weak var view_lackey21: UIView!
	@IBOutlet weak var view_lackey22: UIView!
	@IBOutlet weak var view_lackey23: UIView!
	@IBOutlet weak var view_lackey24: UIView!
	
	@IBOutlet weak var view_mothership: UIView!
	@IBOutlet weak var view_normandy: UIView!
	
	@IBOutlet weak var imgView_lackey1: UIImageView!
	@IBOutlet weak var imgView_lackey2: UIImageView!
	@IBOutlet weak var imgView_lackey3: UIImageView!
	@IBOutlet weak var imgView_lackey4: UIImageView!
	@IBOutlet weak var imgView_lackey5: UIImageView!
	@IBOutlet weak var imgView_lackey6: UIImageView!
	@IBOutlet weak var imgView_lackey7: UIImageView!
	@IBOutlet weak var imgView_lackey8: UIImageView!
	@IBOutlet weak var imgView_lackey9: UIImageView!
	@IBOutlet weak var imgView_lackey10: UIImageView!
	@IBOutlet weak var imgView_lackey11: UIImageView!
	@IBOutlet weak var imgView_lackey12: UIImageView!
	@IBOutlet weak var imgView_lackey13: UIImageView!
	@IBOutlet weak var imgView_lackey14: UIImageView!
	@IBOutlet weak var imgView_lackey15: UIImageView!
	@IBOutlet weak var imgView_lackey16: UIImageView!
	@IBOutlet weak var imgView_lackey17: UIImageView!
	@IBOutlet weak var imgView_lackey18: UIImageView!
	@IBOutlet weak var imgView_lackey19: UIImageView!
	@IBOutlet weak var imgView_lackey20: UIImageView!
	@IBOutlet weak var imgView_lackey21: UIImageView!
	@IBOutlet weak var imgView_lackey22: UIImageView!
	@IBOutlet weak var imgView_lackey23: UIImageView!
	@IBOutlet weak var imgView_lackey24: UIImageView!
	
	@IBOutlet weak var img_mothership: UIImageView!
	@IBOutlet weak var img_normandy: UIImageView!
	
	@IBOutlet weak var slider_normandy: UISlider!
	@IBOutlet weak var button_startGame: UIButton!
	
	//-----------------------------------
	//------------ Variables ------------
	let normandy = "normandy"
	let lackey = "lackey"
	let mothership = "mothership"
	var shotX, shotY: Float!
	var arrayBullets = [UIView]()
	var arrayLackeys = [UIView]()
	var arrayImgLackeys = [UIImageView]()
	var arrayMotherShip = [UIView]()
	
	var animationTimer: Timer!		/* Variable of time animation */
	var distance = 0				/* Incremental distance to animate */
	var maxDistance: Int!			/* Max distance to animate by screen */
	var nBullets: Int!				/* Bullets number to shot, the game can change the value */
	var animationY: CGFloat!		/* Distance on pixels to animate */
	var shotSpeed: Double!			/* To apply to time interval animation */
	//-----------------------------------
	//============================ The loader =============================
    override func viewDidLoad()
	{
        super.viewDidLoad()
		//-----
		gameConfig(); gameMode()
		startPlaceEnemies(); spaceshipBulletsCreation(nBullets)
		//-----
    }
	//=====================================================================
	
	//======================== Loading Fonctions ==========================
	//------------- Shots creations -------------
	func spaceshipBulletsCreation(_ nBullets: Int)
	{
		for _ in 1...nBullets
		{
			let bullet = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 10))
			
			bullet.backgroundColor = UIColor.white
			
			arrayBullets.append(bullet)
		}
	}
	func gameMode()
	{
		//to test
		nBullets = 1
		animationY = 1
		shotSpeed = 0.001
	}
	//-------------------------------------------
	//----------- Game vonfiguration ------------ 	SET HERE THE MAX DISTANCE TO ANIMATION
	func gameConfig()
	{
		//-- Slider loader --
		slider_normandy.value = Float(view.frame.width * 0.5)	/* Initial value to slider */
		//-------------------
		//-- Initial position --
		view_normandy.center.x = view.frame.width * 0.5			/* To position in x mid frame */
		view_normandy.center.y = view.frame.height * 0.9017		/* To position in y frame proportional position */
		//----------------------
		//-- Shot's start --
		shotX = slider_normandy.value							/* Initial shot X value */
		shotY = Float(view.frame.height * 0.9017)				/* Initial shot Y value */
		//------------------
		//-- Animations config -
		maxDistance = Int(view.frame.height - view.frame.height * 0.0983)
		//----------------------
		/* Actualization of max and min slider values by mobiles screen sizes */
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
	//-------------------------------------------
	func startPlaceEnemies()
	{
		arrayLackeys = [view_lackey1, view_lackey2, view_lackey3, view_lackey4,
						view_lackey5, view_lackey6, view_lackey7, view_lackey8,
						view_lackey9, view_lackey10, view_lackey11, view_lackey12,
						view_lackey13, view_lackey14, view_lackey15, view_lackey16,
						view_lackey17, view_lackey18, view_lackey19, view_lackey20,
						view_lackey21, view_lackey22, view_lackey23, view_lackey24]
	
		arrayImgLackeys = [imgView_lackey1,imgView_lackey2,imgView_lackey3,imgView_lackey4,
						   imgView_lackey5,imgView_lackey6,imgView_lackey7,imgView_lackey8,
						   imgView_lackey9,imgView_lackey10,imgView_lackey11,imgView_lackey12,
						   imgView_lackey13,imgView_lackey14,imgView_lackey15,imgView_lackey16,
						   imgView_lackey17,imgView_lackey18,imgView_lackey19,imgView_lackey20,
						   imgView_lackey21,imgView_lackey22,imgView_lackey23,imgView_lackey24]
		
		//-- Set images to imgViews lackeys
		for element in arrayImgLackeys { element.image = UIImage.init(named: "lackey.png") }
		//-- Set image to mothership
		img_mothership.image = UIImage(named: "mothership.png")
	}
	//=====================================================================
	//=========================== Game Actions ============================
	//------------ Normandy's shifting ----------
	@IBAction func start_game(_ sender: UIButton)
	{
		//-- One shot condition --
		if animationTimer != nil
		{ return }
		//-- Shot --
		shot()
		//--
		
    }
	
	//-------------------------------------------
	//------------ Normandy's shifting ----------
	@IBAction func shifting_normandy(_ sender: UISlider)
	{
		shotX = sender.value							/* Dinamics values to shotX */
		view_normandy.center.x = CGFloat(shotX)			/* Dinamics values to move the normandy */
	}
	//-------------------------------------------
	//=====================================================================
	//========================== Game Fonctions ===========================
	func shot()
	{
		placeBulletsForShot(arrayBullets)
		
		for shot in arrayBullets
		{
			/* UIview adds on view */
			self.view.addSubview(shot)
			
			animateNormandyShot()
		}
		
	}
	//----------- Place bullets for shot ---------
	func placeBulletsForShot(_ arrayBullets: [UIView])
	{
		for bullet in arrayBullets
		{
			bullet.center.x = CGFloat(shotX)			/* To spacehipCenter: less half viewShot width */
			bullet.center.y = CGFloat(shotY - 39)				/* less 45 pixels de la normandy */
		}
	}
	//--------------------------------------------
	func animateNormandyShot()
	{
		//- Inicial distace for shot animation
		distance = 0
		//- Animation timer execution -
		animationTimer = Timer.scheduledTimer(timeInterval: shotSpeed,
											  target: self,
											  selector: #selector(animationNS),
											  userInfo: nil,
											  repeats: true)
	}
	
	@objc func animationNS()		/* AnimationNormandyShot */
	{
		//- distance incremental -
		distance += 1
		//-- Stop the animation --
		if distance >= maxDistance { animationTimer.invalidate(); animationTimer = nil }
		//--- Bullet animation ---
		for i in 0..<arrayBullets.count
		{
			arrayBullets[i].center.y -= animationY			/* Bullet animation on screen */
			//--- Bullet kill the lackeys ---
			for element in arrayLackeys
			{
				//-- Frames intersections conditions --
				if arrayBullets[i].frame.intersects(element.frame) == true
				{
					death(lackey, element, arrayBullets[i])	/* Call death's function */
				}
			}
			//-- Bullet kill the mothership --
			for element in arrayMotherShip
			{
				//-- Frames intersections conditions --
				if arrayBullets[i].frame.intersects(element.frame)
				{
					death(mothership, element, arrayBullets[i])
				}
			}
		}
	}
	func death(_ whoIsDead: String,_ theDead: UIView,_ theBullet: UIView)
	{
		switch whoIsDead			//Do and call the animations before remove
		{
		case lackey:
			theDead.removeFromSuperview()			/* Remove the UIView from the main view */
			theBullet.removeFromSuperview()			/* Remove the bullet */
			break
		case normandy:
			
			break
			
		case mothership:
			theDead.removeFromSuperview()
			theBullet.removeFromSuperview()
			break
		default:
			break
		}
	}
	
	//=====================================================================
	
}


















