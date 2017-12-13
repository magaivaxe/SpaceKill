/*
SpaceWar.swift
SpaceKill

Created by eleves on 17-12-04.
Copyright © 2017 marcos. All rights reserved.
*/

import UIKit
import Foundation
import AVFoundation

class TitleScreen: UIViewController
{
	//------------- Outlets -------------
	@IBOutlet weak var imgView_logo: UIImageView!
	@IBOutlet weak var button_startGame: UIButton!
	@IBOutlet weak var button_captainMode: UIButton!
	@IBOutlet weak var button_heroWar: UIButton!
	@IBOutlet weak var button_godWar: UIButton!
	@IBOutlet weak var label_gameMode: UILabel!
	//-----------------------------------
	//------------ Variables ------------
	var arrayButtons: [UIButton]!
	var timerMusic: Timer!
	var audioBgMusic = AVAudioPlayer()
	var audioClickStart = AVAudioPlayer()
	var audioMode = AVAudioPlayer()
	//-----------------------------------
	//------------- Classes -------------
	let object_style = Styles()
	//-----------------------------------
	//============================ viewDidLoad ============================
    override func viewDidLoad()
	{
        super.viewDidLoad()
		
		setArrays(); musicsAndSounds(); elementsStyles(); playBgMusic()
		
		
		
    }
	//=====================================================================
	//========================== Load functions ===========================
	//---- Play background music
	func playBgMusic()
	{
		timerMusic = Timer.scheduledTimer(timeInterval: 1, target: self,
										  selector: #selector(play),
										  userInfo: nil, repeats: true)
	}
	@objc func play()
	{
		if audioBgMusic.isPlaying == false { audioBgMusic.play() }
	}
	//----
	func elementsStyles()
	{
		object_style.styleArrayOfUIButtons(arrayButtons, UIFont.init(name: "Space Age", size: 25), UIColor.white,
										   15, 5, UIColor.white.cgColor, UIColor.black.cgColor, 1)
		
	}
	//----
	//---- Prepare all sounds and musics
	func musicsAndSounds()
	{
		do
		{
			audioBgMusic = try AVAudioPlayer(contentsOf: .init(fileURLWithPath: Bundle.main.path(forResource: "startMusic", ofType: "mp3")!))
			audioBgMusic.prepareToPlay()
			
			audioClickStart = try AVAudioPlayer(contentsOf: .init(fileURLWithPath: Bundle.main.path(forResource: "clickStart", ofType: "mp3")!))
			audioClickStart.prepareToPlay()
			
			audioMode = try AVAudioPlayer(contentsOf: .init(fileURLWithPath: Bundle.main.path(forResource: "shot", ofType: "wav")!))
			audioMode.prepareToPlay()
			
		}
		catch { print(error) }
	}
	//----
	//---- Set the arrays
	func setArrays()
	{
		arrayButtons = [button_startGame, button_captainMode,
						button_heroWar, button_godWar]
	}
	//----
    //=====================================================================

	

}
