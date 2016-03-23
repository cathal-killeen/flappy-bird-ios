//
//  Game.m
//  Flappy Bird
//
//  Created by Cathal on 22/11/2014.
//  Copyright (c) 2014 Cathal. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)GameOver{
    
    if(ScoreValue > HighScoreValue){
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreValue forKey:@"HighScoreSaved"];
        
    }
    
    [PipeMovement invalidate];
    [BirdMovement invalidate];
    
    Menu.hidden = NO;
    
}

-(IBAction)StartGame:(id)sender{
    
    TopPipe.hidden = NO;
    BottomPipe.hidden = NO;
    
    StartGame.hidden = YES;
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlacePipes];
    
    PipeMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(PipeMoving) userInfo:nil repeats:YES];
}

-(void)PipeMoving{
    
    TopPipe.center = CGPointMake(TopPipe.center.x - 1, TopPipe.center.y);
    BottomPipe.center = CGPointMake(BottomPipe.center.x -1, BottomPipe.center.y);
    
    if(TopPipe.center.x < - 39){
        [self PlacePipes];
    }
    
    if(TopPipe.center.x == 25){
        [self Score];
    }
    
    if(CGRectIntersectsRect(Bird.frame, TopPipe.frame)){
        [self GameOver];
    }
    
    if(CGRectIntersectsRect(Bird.frame, BottomPipe.frame)){
        [self GameOver];
    }
    
    if(CGRectIntersectsRect(Bird.frame, Ground.frame)){
        [self GameOver];
    }
    
}

-(void)Score{
    
    ScoreValue = ScoreValue + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreValue];
    
}

-(void)PlacePipes{
    
    RandomTopPipePosition = arc4random() %350;
    RandomTopPipePosition = RandomTopPipePosition -200;
    RandomBottomPipePosition = RandomTopPipePosition + 540;
    
    TopPipe.center = CGPointMake(340, RandomTopPipePosition);
    BottomPipe.center = CGPointMake(340, RandomBottomPipePosition);
    
    
}


-(void)BirdMoving{
    
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    BirdFlight = BirdFlight - 5;
    
    if(BirdFlight < -15){
        
        BirdFlight = -15;
    }
    
    if(BirdFlight <= 5){
        
        Bird.image = [UIImage imageNamed:@"FBbirdU.png"];
        
    }else if(BirdFlight >= 5){
        
        Bird.image = [UIImage imageNamed:@"FBbirdD.png"];
        
    }else if(BirdFlight < 5 || BirdFlight > -5){
        
        Bird.image = [UIImage imageNamed:@"FBbirdM.png"];
        
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    BirdFlight = 30;
    
    
}


- (void)viewDidLoad {
    
    TopPipe.hidden = YES;
    BottomPipe.hidden = YES;
    
    Menu.hidden = YES;
    ScoreValue = 0;
    
    HighScoreValue = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
