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
	@IBOutlet weak var button_startGame: UIButton!
	
	//-----------------------------------
	//------------ Variables ------------
	let normandy = "normandy"
	let lackey = "lackey"
	let mothership = "mothership"
	var shotX, shotY: Float!
	var arrayBullets, arrayLaquais: [UIView]!
	
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
	//---------- Slider Configuration ----------- 	SET HERE THE MAX DISTANCE TO ANIMATION
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
	
		//viewBullet.frame.intersection(<#T##r2: CGRect##CGRect#>) conditions to destroid
	
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
	
	@objc func animationNS()
	{	/* distance incremental */
		distance += 1
		/* Stop the animation */
		if distance >= maxDistance { animationTimer.invalidate(); animationTimer = nil }
		
		/* Animation */
		//aShot.center.y += animationY
		for i in 0..<arrayBullets.count
		{
			arrayBullets[i].center.y -= animationY
			
			for laquais in arrayLaquais
			{
				if arrayBullets[i].frame.intersects(laquais.frame) == true
				{
					death(lackey)
				}
			}
		}
	}
	func death(_ whoIsDead: String)
	{
		switch whoIsDead
		{
		case lackey:
			
			break
			
		case normandy:
			
			break
			
		case mothership:
			
			break
			
		default:
			break
		}
	}
	
	//=====================================================================
	
}


















