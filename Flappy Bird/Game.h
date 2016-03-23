//
//  Game.h
//  Flappy Bird
//
//  Created by Cathal on 22/11/2014.
//  Copyright (c) 2014 Cathal. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;
int RandomBottomPipePosition;
int RandomTopPipePosition;
int ScoreValue;
NSInteger HighScoreValue;

@interface Game : UIViewController
{
    
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *TopPipe;
    IBOutlet UIImageView *BottomPipe;
    IBOutlet UIImageView *Ground;
    IBOutlet UIButton *Menu;
    IBOutlet UILabel *ScoreLabel;
    
    NSTimer *BirdMovement;
    NSTimer *PipeMovement;
    
    
    
}

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)PipeMoving;
-(void)PlacePipes;
-(void)Score;
-(void)GameOver;


@end
