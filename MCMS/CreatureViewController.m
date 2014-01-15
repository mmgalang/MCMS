//
//  creatureViewController.m
//  MCMS
//
//  Created by Marcial Galang on 1/14/14.
//  Copyright (c) 2014 Marc Galang. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController ()
{
    __weak IBOutlet UILabel *name;
    __weak IBOutlet UITextField *nameTextField;
    __weak IBOutlet UITextView *myTextView;
    __weak IBOutlet UIImageView *myImageView;
    BOOL isEditPressed;
}

@end

@implementation CreatureViewController

@synthesize creature;


- (void)viewDidLoad
{
    [super viewDidLoad];
    name.text = creature.name;
    nameTextField.alpha = 0;
    isEditPressed = YES;
    myTextView.text = creature.description;
    myImageView.image = creature.picture;
}

- (IBAction)onSaveButtonPressed:(id)sender {
    creature.name = nameTextField.text;
    name.text = nameTextField.text;
    name.alpha = 1;
    nameTextField.alpha = 0;
}

- (IBAction)onEditButtonPressed:(id)sender
{
    if (isEditPressed) {
        isEditPressed = NO;
        name.alpha = 0;
        nameTextField.alpha = 1;
        nameTextField.text = name.text;
        
    } else  {
        isEditPressed = YES;
        name.alpha = 1;
        nameTextField.alpha = 0;
        name.text = nameTextField.text;
        creature.name = nameTextField.text;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
