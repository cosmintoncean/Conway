//
//  GOLViewController.m
//  GameOfLife
//
//  Created by Cosmin Toncean on 18/01/14.
//  Copyright (c) 2014 Cosmin Toncean. All rights reserved.
//

#import "GOLViewController.h"
#import "GOLGameView.h"
#import "GOLEngine.h"

@interface GOLViewController ()

@end

@implementation GOLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    gGameView = [[GOLGameView alloc] initWithFrame:CGRectMake(20, 20, 700, 700)];
    [self.view addSubview:gGameView];
    [gGameView setupGrid];
    shouldAnimate = NO;
    
    gameEngine = [[GOLEngine alloc] initWithGameBoard:gGameView];
}

- (void)animateSimulationFrame {
    if (shouldAnimate) {
        [UIView animateWithDuration:0.2f animations:^{
            [gameEngine iterateOnDotsArray:[gGameView subviews]];
        } completion:^(BOOL finished) {
            [self animateSimulationFrame];
        }];
    }
}

- (IBAction)runSimulationButtonPressed:(id)sender {
    shouldAnimate = YES;
    [self animateSimulationFrame];
}

- (IBAction)stopSimulationButtonPressed:(id)sender {
    shouldAnimate = NO;
}

@end
