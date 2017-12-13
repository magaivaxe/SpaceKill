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
	//------------ Constants ------------
	let normandy = "normandy"
	let lackey = "lackey"
	let mothership = "mothership"
	let mothershipBullet = "mothership bullet"
	//-----------------------------------
	//------------ Variables ------------
	var shotX, msShotX, msShotY, shotY: Float!
	var animationX, animationY, animationLackeysY: CGFloat!								/* Distance on pixels to animate */
	var maxAngle, minAngle, anglesDivised: Double!
	var maxAngleLc, minAngleLc, anglesDivisedLc: Double!
	var mothershipProbabilityShot, mothershipSpeedShot: Double!
	var lackeysProbabilityShot, lackeysSpeedShot: Double!
	var shotSpeed, mothershipSpeed, lackeySpeed : Double!
	var maxDistance, maxMsDistance, rightOrLeftMS, rightOrLeftLC: Int!									/* Max distance to animate by screen */
	var nBullets, nMsBullets, nLcBullets: Int!										/* Bullets number to shot, the game can change the value */
	var mothershipLife, lackeysLifes: Int!
	var distanceBullet = 0												/* Incremental distance to animate normandy's shot */
	var distanceMsBullet = 0											/* Incremental distance to animate mothership's shot */
	var distanceLcBullet = 0
	var dificultyMode: String!
	var sampleSpace, sampleSpaceLc: UInt32!
	var multipleShotLc: Bool!
	
	var arrayMothershipBullets = [UIView]()
	var arrayBullets = [UIView]()
	var arrayLackeyBullets = [UIView]()
	var arrayLackeys = [UIView]()
	var arrayLackeysToShot = [UIView]()
	var arrayLackeysDisplaced = [UIView]()
	var arrayImgLackeys = [UIImageView]()
	var tupleMotherShip = [(ms: UIView, life: Int)]()
	var tupleLackeys = [(lc: UIView, life: Int)]()
	var arrayCos = [Double]()
	var arraySin = [Double]()
	var arrayAngles = [Double]()
	var arrayCosLc = [Double]()
	var arraySinLc = [Double]()
	var arrayAnglesLc = [Double]()
	
	var aniBulletTimer, aniBulletLackey, aniBulletMothership: Timer!							/* Variable of time animation */
	var aniRightMothershipTimer, aniLeftMothershipTimer: Timer!
	var aniRightLackeysTimer, aniLeftLackeysTimer: Timer!
	//-----------------------------------

	//------------- Classes -------------
	let object_saveLoad = SaveAndLoad()
	//-----------------------------------
	
	//============================ The loader =============================
    override func viewDidLoad()
	{
        super.viewDidLoad()
		//-----
		gameConfig(); gameMode()
		startPlaceEnemies(); spaceshipsBulletsCreation(nBullets, nMsBullets, nLcBullets)
		moveChoice(); moveMothership(); moveLackeys()
		//-----
    }
	//=====================================================================
	//======================== Loading Fonctions ==========================
	//------------- Shots creations -------------
	func spaceshipsBulletsCreation(_ nBullets: Int,_ nMsBullets: Int,_ nLcBullets: Int)
	{
		//---- Normandy's bullets ----
		for _ in 1...nBullets
		{
			let bullet = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 10))
			
			bullet.backgroundColor = UIColor.white
			
			arrayBullets.append(bullet)
		}
		//---- Mothership's bullets ----
		for _ in 1...nMsBullets
		{
			let msBullet = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
			
			msBullet.backgroundColor = UIColor.white
			msBullet.layer.cornerRadius = msBullet.frame.width / 2
			
			arrayMothershipBullets.append(msBullet)
		}
		//---- Lackey's bullets ----
		for _ in 1...nLcBullets
		{
			let lcBullet = UIView(frame: .init(x: 0, y: 0, width: 10, height: 10))
			
			lcBullet.backgroundColor = UIColor.white
			lcBullet.layer.cornerRadius = lcBullet.frame.width / 2
			
			arrayLackeyBullets.append(lcBullet)
		}
	}
	//-------------- Mods choiced ---------------
	func gameMode()
	{
		//------ Normandy's modes -------
		nBullets = 1
		animationY = 1; animationX = 1
		shotSpeed = 0.001
		//-------------------------------
		
		dificultyMode = object_saveLoad.loadData(fileName: "fileMode") as! String /* load the mode */
		
		switch dificultyMode
		{
		case "captain":
			//------ Mothership's modes -------
			nMsBullets = 5; mothershipLife = 15
			mothershipProbabilityShot = 1; sampleSpace = 300
			mothershipSpeed = 0.01; mothershipSpeedShot = 0.008
			minAngle = 230; maxAngle = 315
			
			//------ Lackey's modes -------
			nLcBullets = 3; lackeysLifes = 1
			lackeysProbabilityShot = 1; sampleSpaceLc = 300
			lackeySpeed = 0.01; lackeysSpeedShot = 0.005
			minAngleLc = 245; maxAngleLc = 320
			animationLackeysY = 5; multipleShotLc = false
			
			break
		case "hero":
			//------ Mothership's modes -------
			nMsBullets = 10; mothershipLife = 20
			mothershipProbabilityShot = 1; sampleSpace = 200
			mothershipSpeed = 0.005; mothershipSpeedShot = 0.004		//FAIRE LE MULTIPLE SHOT
			minAngle = 230; maxAngle = 315
			
			//------ Lackey's modes -------
			nLcBullets = 6; lackeysLifes = 2
			lackeysProbabilityShot = 1; sampleSpaceLc = 200
			lackeySpeed = 0.01; lackeysSpeedShot = 0.003
			minAngleLc = 230; maxAngleLc = 315
			animationLackeysY = 5; multipleShotLc = true
			break
			
		case "god":
			//------ Mothership's modes -------
			nMsBullets = 15; mothershipLife = 25
			mothershipProbabilityShot = 1; sampleSpace = 100
			mothershipSpeed = 0.002; mothershipSpeedShot = 0.002
			minAngle = 230; maxAngle = 315
			
			//------ Lackey's modes -------
			nLcBullets = 9; lackeysLifes = 3
			lackeysProbabilityShot = 1; sampleSpaceLc = 100
			lackeySpeed = 0.01; lackeysSpeedShot = 0.001
			minAngleLc = 230; maxAngleLc = 315
			animationLackeysY = 5; multipleShotLc = true
			break
			
		default:
			break
		}
		
	}
	//-------------------------------------------
	//----------- Start place enemies -----------
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
		
		//--- Set the tuple of lackeys
		for lac in arrayLackeys
		{
			tupleLackeys.append((lac, lackeysLifes))
		}
		
		tupleMotherShip = [(ms: view_mothership, life: mothershipLife)]
		
		//-- Set images to imgViews lackeys
		for element in arrayImgLackeys { element.image = UIImage.init(named: "lackey.png") }
		//-- Set image to mothership
		img_mothership.image = UIImage(named: "mothership.png")
	}
	//-------------------------------------------
	//----------- Game configuration ------------ 	
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
		msShotY = Float(view.frame.height * 0.09472)			/* Initial shot Y mothership */
		//------------------
		//-- Animations config -
		maxDistance = Int(view.frame.height - view.frame.height * 0.0983)
		maxMsDistance = Int(1.2 * view.frame.height)
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
	//=====================================================================
	//=========================== Game Actions ============================
	//------------ Normandy's shifting ----------
	@IBAction func start_game(_ sender: UIButton)
	{
		//-- One shot condition --
		if aniBulletTimer != nil
		{ return }
		//-- Shot --
		shot()
    }
	
	//-------------------------------------------
	//------------ Normandy's shifting ----------
	@IBAction func shifting_normandy(_ sender: UISlider) //touches move au lieu du slider
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
			self.view.addSubview(shot) /* UIview adds on view */
			
			animateNormandyShot()
		}
		
	}
	//----------- Place bullets for shot ---------
	func placeBulletsForShot(_ arrayBullets: [UIView])
	{
		for bullet in arrayBullets
		{
			bullet.center.x = CGFloat(shotX)			/* To spacehipCenter: less half viewShot width */
			bullet.center.y = CGFloat(shotY - 39)		/* less 45 pixels de la normandy */
		}
	}
	//--------------------------------------------
    //=================== Normandy's Animations shots =====================
	func animateNormandyShot()
	{
		//- Inicial distace for shot animation
		distanceBullet = 0
		//- Animation timer execution -
		aniBulletTimer = Timer.scheduledTimer(timeInterval: shotSpeed,
											  target: self,
											  selector: #selector(animationNS),
											  userInfo: nil,
											  repeats: true)
	}
	//-- Normandy shot animation --
	@objc func animationNS()
	{
		//- distance incremental -
		distanceBullet += 1
		//-- Stop the animation --
		if distanceBullet >= maxDistance { aniBulletTimer.invalidate(); aniBulletTimer = nil }
		//--- Bullet animation ---
		for bullet in arrayBullets
		{
			bullet.center.y -= animationY					/* Bullet animation on screen */
			//--- Bullet kill the lackeys ---
			for i in 0..<tupleLackeys.count
			{
				//-- Frames intersections conditions --
				if bullet.frame.intersects(tupleLackeys[i].lc.frame) == true
				{
					tupleLackeys[i].life -= 1
					
					if tupleLackeys[i].life == 0
					{
						death(lackey, tupleLackeys[i].lc, bullet)	/* Call death's function */
					}
					
					aniBulletTimer.invalidate()				/* Stop animation */
					aniBulletTimer = nil
					bullet.removeFromSuperview()			/* Remove the bullet from the main view */
				}
			}
			//-- Bullet kill the mothership --
			//-- Frames intersections conditions --
			if bullet.frame.intersects(tupleMotherShip[0].ms.frame)
			{
				tupleMotherShip[0].life -= 1		/* Mothership life dedremantation */
				
				if tupleMotherShip[0].life == 0
				{
					death(mothership, tupleMotherShip[0].ms, bullet)
					
					//--- Stop mothership left animation
					if aniLeftMothershipTimer != nil
					{ aniLeftMothershipTimer.invalidate()
						aniLeftMothershipTimer = nil }
					
					//--- Stop mothership right animation
					if aniRightMothershipTimer != nil
					{ aniRightMothershipTimer.invalidate()
						aniRightMothershipTimer = nil }
				}
				//--- Stop normandy bullet animation
				aniBulletTimer.invalidate()
				aniBulletTimer = nil
				bullet.removeFromSuperview()					/* Remove the bullet from the main view if don't kill */
			}
		}
	}
    //=====================================================================
    //===================== Enemies's Actions moves =======================
	//--------- MothershipShot ----------
	func shotOfMothership()
	{
		let shot = Double(arc4random_uniform(sampleSpace))
		
		if (shot <= mothershipProbabilityShot && aniBulletMothership == nil)
		{
			placeMothershipShot(arrayMothershipBullets)
			animatedMothershipShot()
		}
		else {return}
	}
	
	func placeMothershipShot(_ arrayMsBullets: [UIView])
	{
		for msBullet in arrayMsBullets
		{
			msBullet.center.x = CGFloat(msShotX)
			msBullet.center.y = CGFloat(msShotY)
			
			self.view.addSubview(msBullet)
		}
		anglesDivised = (maxAngle - minAngle) / Double(arrayMsBullets.count)		/* it is the incremantations for each bullet */
		var angle: Double = 0
		
		arraySin = []; arrayCos = []
		while arrayCos.count != arrayMsBullets.count
		{
			let cos = __cospi((minAngle + angle)/180); arrayCos.append(cos)
			let sin = __sinpi((minAngle + angle)/180); arraySin.append(sin)
			//---- Angles to reflection
			arrayAngles.append(minAngle + angle)
			angle += anglesDivised
		}
		
	}
	
	func animatedMothershipShot()
	{
		aniBulletMothership = Timer.scheduledTimer(timeInterval: mothershipSpeedShot,
												   target: self,
												   selector: #selector(animationMS),
												   userInfo: nil,
												   repeats: true)
	}
	
	@objc func animationMS()
	{
		distanceMsBullet += 1
		
		if distanceMsBullet >= maxMsDistance
		{
			aniBulletMothership.invalidate()
			aniBulletMothership = nil
			distanceMsBullet = 0
			for b in arrayMothershipBullets { b.removeFromSuperview() }
		}
		
		for i in 0..<arrayMothershipBullets.count
		{
			//--- Left wall mothership bullets reflections
			if arrayMothershipBullets[i].center.x < arrayMothershipBullets[i].frame.width / 2
			{
				arrayCos[i] = __cospi((540 - arrayAngles[i]) / 180)
				arraySin[i] = __sinpi((540 - arrayAngles[i]) / 180)
			}
			//--- Right wall mothership bullets reflections
			if arrayMothershipBullets[i].center.x > self.view.frame.width - arrayMothershipBullets[i].frame.width / 2
			{
				arrayCos[i] = __cospi((540 - arrayAngles[i]) / 180)
				arraySin[i] = __sinpi((540 - arrayAngles[i]) / 180)
			}
			//--- animation
			arrayMothershipBullets[i].center.x -= CGFloat(arrayCos[i])
			arrayMothershipBullets[i].center.y -= CGFloat(arraySin[i])
		}
	}
	//-----------------------------------
	//------- Lackey's animations -------
	func moveChoice()
	{
		rightOrLeftMS = Int(arc4random_uniform(2))
		rightOrLeftLC = Int(arc4random_uniform(2))
	}
	//----- Mothership's animations -----
    func moveMothership()
	{
		if rightOrLeftMS == 0
		{
			aniRightMothershipTimer = Timer.scheduledTimer(timeInterval: mothershipSpeed,
														   target: self,
													  	   selector: #selector(animationMothershipToRight),
													  	   userInfo: nil,
													  	   repeats: true)
		}
		if rightOrLeftMS == 1
		{
			aniLeftMothershipTimer = Timer.scheduledTimer(timeInterval: mothershipSpeed,
														  target: self,
														  selector: #selector(animationMothershipToLeft),
														  userInfo: nil,
														  repeats: true)
		}
	}
	//---- Mothership's animations to right -----
	@objc func animationMothershipToRight()
	{
		if view_mothership.center.x == self.view.frame.width - view_mothership.frame.width / 2
		{
			aniRightMothershipTimer.invalidate()
			aniRightMothershipTimer = nil
			rightOrLeftMS = 1
			moveMothership()
		}
		view_mothership.center.x += animationX
		
		msShotX = Float(view_mothership.center.x)
		shotOfMothership()
		shotOfLackeys()
		
		if multipleShotLc == true { shotOfLackeys() }
	}
	//----- Mothership's animations to left ------
	@objc func animationMothershipToLeft()
	{
		if view_mothership.center.x == view_mothership.frame.width / 2
		{
			aniLeftMothershipTimer.invalidate()
			aniLeftMothershipTimer = nil
			rightOrLeftMS = 0
			moveMothership()
		}
		view_mothership.center.x -= animationX
		
		msShotX = Float(view_mothership.center.x)
		shotOfMothership()
		shotOfLackeys()
		
		if multipleShotLc == true { shotOfLackeys() }
	}
	//--------------------------------------------
	func moveLackeys()
	{
		UIView.animate(withDuration: lackeySpeed,
					   delay: 0,
					   options: [.autoreverse, .repeat], animations: {
		for (tc, _) in self.tupleLackeys
		{
			tc.center.y += self.animationLackeysY
		}
		})
	}
	
	//---- Lackeys Fonctions ----
	func shotOfLackeys()
	{
		let shot = Double(arc4random_uniform(sampleSpaceLc))
		let theChosenOne: UIView!
		//----- Condition to call the fonction
		if shot <= lackeysProbabilityShot && aniBulletLackey == nil
		{
			theChosenOne = theChosenLackey()
			placeLackeyShot(theChosenOne)
			lackeyShot()
		}
	}
	func lackeyShot()
	{
		aniBulletLackey = Timer.scheduledTimer(timeInterval: lackeysSpeedShot,
											   target: self,
											   selector: #selector(animationLackeyShot),
											   userInfo: nil,
											   repeats: true)
	}
	@objc func animationLackeyShot()
	{
		distanceLcBullet += 1
		
		if distanceLcBullet >= maxMsDistance
		{
			aniBulletLackey.invalidate()
			aniBulletLackey = nil
			distanceLcBullet = 0
		}
		
		for i in 0..<arrayLackeyBullets.count
		{
			//--- Left wall lackey bullets reflections
			if arrayLackeyBullets[i].center.x < arrayLackeyBullets[i].frame.width / 2
			{
				arrayCosLc[i] = __cospi((540 - arrayAnglesLc[i]) / 180)
				arraySinLc[i] = __sinpi((540 - arrayAnglesLc[i]) / 180)
			}
			//--- Right wall lackey bullets reflections
			if arrayLackeyBullets[i].center.x > self.view.frame.width - arrayLackeyBullets[i].frame.width / 2
			{
				arrayCosLc[i] = __cospi((540 - arrayAnglesLc[i]) / 180)
				arraySinLc[i] = __sinpi((540 - arrayAnglesLc[i]) / 180)
			}
			
			arrayLackeyBullets[i].center.x -= CGFloat(arrayCosLc[i])
			arrayLackeyBullets[i].center.y -= CGFloat(arraySinLc[i])
		}
	}
	
	func theChosenLackey() -> UIView
	{
		arrayLackeysToShot = []
		
		for i in 0..<tupleLackeys.count
		{
			if tupleLackeys[i].lc.frame.origin.x != -500		/* Condition to remove the dead lackeys */
			{
				arrayLackeysToShot.append(tupleLackeys[i].lc)
			}
		}
		
		let chosen = Int(arc4random_uniform(UInt32(arrayLackeysToShot.count)))
		
		return arrayLackeysToShot[chosen]
	}
	func placeLackeyShot(_ theChosen: UIView)
	{
		for bullet in arrayLackeyBullets
		{
			bullet.center.x = theChosen.center.x
			bullet.center.y = theChosen.center.y
			
			self.view.addSubview(bullet)
		}
		
		anglesDivisedLc = (maxAngleLc - minAngleLc) / Double(arrayLackeyBullets.count)		/* it is the incremantations for each bullet */
		var angle: Double = 0
		
		arraySinLc = []; arrayCosLc = []
		while arrayCosLc.count != arrayLackeyBullets.count
		{
			let cos = __cospi((minAngleLc + angle)/180); arrayCosLc.append(cos)
			let sin = __sinpi((minAngleLc + angle)/180); arraySinLc.append(sin)
			//---- Angles to reflection
			arrayAnglesLc.append(minAngleLc + angle)
			angle += anglesDivisedLc
		}
	}
    //=====================================================================
    
    func death(_ whoIsDead: String,_ theDead: UIView,_ theBullet: UIView)
	{
		switch whoIsDead							//Do and call the animations before remove
		{
		case lackey:
			
			theDead.removeFromSuperview()			/* Remove the lackey from the main view */
            theDead.frame.origin.x = -500			/* Remove the phanton to position -500 */
			arrayLackeysDisplaced.append(theDead)	/* Add the dead lackeys to conditions */
			break
			
		case normandy:
			
			break
			
		case mothership:
			
			theDead.removeFromSuperview()
            theDead.frame.origin.x = -500
			break
			
		case mothershipBullet:
			
			theDead.removeFromSuperview()
			theDead.frame.origin.x = -500
			aniBulletTimer.invalidate()
			aniBulletTimer = nil
			theBullet.removeFromSuperview()
			break
			
		default:
			break
		}
	}
	//=====================================================================
}


















