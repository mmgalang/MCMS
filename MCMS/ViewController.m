//
//  ViewController.m
//  MCMS
//
//  Created by Marcial Galang on 1/14/14.
//  Copyright (c) 2014 Marc Galang. All rights reserved.
//

#import "ViewController.h"
#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{

    
    NSMutableArray *creatures;
    __weak IBOutlet UITextField *magicalCreatureTextField;
    __weak IBOutlet UITableView *myTableView;
   
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{

    MagicalCreature *creature;
    [super viewDidLoad];
    
    creatures = [NSMutableArray array];
    
    creature =[[MagicalCreature alloc] init];
    creature.name = @"Pinkie Pie";
    creature.description = @"A pink earth pony with light blue eyes and curly, darker pink mane and tail. Her cutie mark is two blue balloons with yellow strings and one yellow balloon with a blue string.";
    creature.picture = [UIImage imageNamed:@"PinkiePie.png"];
    [creatures addObject:creature];
    
    
    creature =[[MagicalCreature alloc] init];
    creature.name = @"Fluttershy";
    creature.description =@"A light yellow pegasus pony with teal eyes and a pink mane and tail. Her cutie mark is three pink butterflies. She speaks in a quiet, soft voice. She is sweet and calm, and is often very shy around others. ";
    creature.picture = [UIImage imageNamed:@"Fluttershy.png"];
    [creatures addObject:creature];
    
    creature =[[MagicalCreature alloc] init];
    creature.name = @"Rarity";
    creature.description = @"A silvery-white unicorn pony with blue eyes, and a violet mane and tail that are combed in wavy curls and a cutie mark made of three cyan diamonds. She speaks with a Mid-Atlantic accent. ";
    creature.picture = [UIImage imageNamed:@"Rarity.png"];
    [creatures addObject:creature];
    
}

- (IBAction)onAddButtonPressed:(id)sender
{
    MagicalCreature *myCreature = [[MagicalCreature alloc] init];
    myCreature.name = magicalCreatureTextField.text;
    [creatures addObject:myCreature];
    [myTableView reloadData];
    
    
    magicalCreatureTextField.text = @"";

        [magicalCreatureTextField resignFirstResponder];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *viewController = segue.destinationViewController;
    NSIndexPath *indexPath = [myTableView indexPathForSelectedRow];
    viewController.creature = creatures[indexPath.row];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return creatures.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:@"creatureCellID"];
    MagicalCreature *myCreature = creatures[indexPath.row];
    
    cell.textLabel.text = myCreature.name;
    //[creatures objectAtIndex:indexPath.row];
    cell.imageView.image = myCreature.picture;
    
    return cell;

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
