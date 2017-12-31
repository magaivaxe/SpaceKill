//
//  EnemyShot.swift
//  SpaceKill
//
//  Created by Marcos Gomes on 17-12-30.
//  Copyright © 2017 marcos. All rights reserved.
//

//------- Libraries -------
import Foundation
import UIKit
import AVFoundation
//-------------------------

/*********************************************************************************************************
*																										 *
*						ENEMYSHOT CLASS - It do the enemies's shots and animations						 *
*																										 *
*						aed = Array of Enemies Displaced: Array of Dead Enemies							 *
**********************************************************************************************************/


class EnemyShot
{
	//------- Variables -------
	var mv: UIView!
	var aeb: [UIView]!
	var ate: [(view: UIView, life: Int)]!
	var aed = [UIView]()
	var tem: (bullets: Int, life: Int, probShot: UInt32, sampleSpace: UInt32, speed: Double,
		speedShot: Double, minAngle: Double, maxAngle: Double)!
	var ss: AVAudioPlayer!
	
	var shotX: Float!
	var shotY: Float!
	var displaced: CGFloat!
	
	var timerShot: Timer!
	//------- Constants -------
	
	//------ Initiation -------
	
	init(mainView mv: UIView,
		 arrayEnemyBullets aeb: [UIView],
		 arrayTupleEnemy ate: [(view: UIView, life: Int)],
		 tupleEnemyMode tem: (bullets: Int, life: Int, probShot: UInt32, sampleSpace: UInt32,
		 	speed: Double, speedShot: Double, minAngle: Double, maxAngle: Double),
		 shotSound ss: AVAudioPlayer)
	{
		//-- Vars to import
		self.mv = mv
		self.aeb = aeb
		self.ate = ate
		self.tem = tem
		self.ss = ss
		//-- Vars to load --
		shotX = Float(ate[0].view.center.x)
		shotY = Float(ate[0].view.center.y + ate[0].view.frame.height / 2)
		displaced = -500
	}
	//Function to shot
	func shotOfEnemy()
	{
		//Shot is the minimum number to shot
		let shot = arc4random_uniform(tem.sampleSpace)
		//The chosen that will be shot
		let chosen: UIView!
		//Probability to shot
		if (shot <= tem.probShot && timerShot == nil && aed.count < ate.count)
		{
			//Call the function to choose the enemy
			chosen = chosenEnemy()
			ss.play()
		}
	}
	//Function to place the bullets before the shot
	func placeBulletsToShot()
	{
		
	}
	//Function to choose the alive chosen enemy
	func chosenEnemy() -> UIView
	{
		//array to append the enemies alives
		var enemiesAlives: [UIView] = []
		//loop to check the alives
		for i in 0..<ate.count
		{
			//Condition to remove dead anemies
			if ate[i].view.frame.origin.x != displaced
			{
				//Add the enemies alives
				enemiesAlives.append(ate[i].view)
			}
		}
		//it choose the chosen
		let chosen = Int(arc4random_uniform(UInt32(enemiesAlives.count)))
		//return the enemy chose
		return enemiesAlives[chosen]
	}
	
	
	
	
	
	
	
}









































