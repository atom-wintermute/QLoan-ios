//
//  QLProfileViewController.m
//  QLoan
//
//  Created by Nikulin Maksim on 20/10/16.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "QLProfileViewController.h"

#import "QLBankAuthService.h"
#import "QLBankCardService.h"
#import "QLProfileCellFactory.h"
#import "QLProfileViewDelegate.h"

#import "QLProfileDataDisplayManager.h"
#import "QLTabBarController.h"
#import "AppDelegate.h"

#import "QLBankUserInfo.h"

static NSString * const QLProfileAddCardSegue = @"profileAddCardSegue";
static NSString * const QLProfileFacebookSegue = @"facebookSegue";

@interface QLProfileViewController () <UITableViewDelegate, QLProfileViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) QLProfileDataDisplayManager *dataDisplayManager;

@end

@implementation QLProfileViewController

#pragma mark - Жизненный цикл

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.navigationItem.title = @"Мой профиль";
    [self configureView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self configureView];
}

#pragma mark - Внешний вид

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - IBActions

- (void)facebookButtonWasPressed:(id)sender {
    [self performSegueWithIdentifier:QLProfileFacebookSegue
                              sender:self];
}

- (void)addPhotoButtonWasPressed:(id)sender 
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
//    [self presentViewController:picker animated:YES completion:nil];
    
//    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
//    imagePicker.delegate = self;
//    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
//    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
//    imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    [self presentViewController:picker
                       animated:YES
                     completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    if (info[UIImagePickerControllerEditedImage]) {
        UIImage *image = info[UIImagePickerControllerEditedImage];
        self.avatarImageView.image = image;
        
        NSURL *imageURL = info[UIImagePickerControllerReferenceURL];
        NSData *data = UIImagePNGRepresentation(image);
        
        QLBankUserInfo *bankUserInfo = [self.bankAuthService obtainCurrentUserData];
        [self.bankAuthService editUserDataWithEmail:bankUserInfo.email
                                          firstName:bankUserInfo.firstName
                                           lastName:bankUserInfo.lastName
                                             avatar:data
                                         completion:^(BOOL success, NSError *error) {
            
                                         }];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
}

#pragma mark - Приватные методы

- (void)configureView {
    [self.view layoutIfNeeded];
    
    QLBankUserInfo *bankUserInfo = [self.bankAuthService obtainCurrentUserData];
    if (!bankUserInfo) {
        return;
    }
    
    if (!bankUserInfo.avatar) {
        self.addPhotoButton.hidden = YES;
        self.avatarImageView.image = [UIImage imageWithData:bankUserInfo.avatar];
    }
    
    self.usernameLabel.text = [NSString stringWithFormat:@"%@ %@", bankUserInfo.firstName, bankUserInfo.lastName];
    
    NSArray <QLBankCard *> *cardList = [self.bankCardService obtainBankCards];
    NSArray *cellObjects = [self.cellFactory cellObjectsFrom:bankUserInfo
                                                    cardList:cardList
                                                    delegate:self];
    self.dataDisplayManager =  [[QLProfileDataDisplayManager alloc] initWithInputData:cellObjects
                                                      andConversionToCellObjectsBlock:^id(id dataObject) {
                                                          return dataObject;
                                                      }];
    
    self.tableView.dataSource = [self.dataDisplayManager dataSourceForTableView:self.tableView];
    self.tableView.delegate = [self.dataDisplayManager delegateForTableView:self.tableView
                                                           withBaseDelegate:self];
    [self.tableView reloadData];
    
    BOOL facebookActive = [self.bankAuthService obtainFacebookEntire];
    if (facebookActive) {
        self.facebookImageView.image = [UIImage imageNamed:@"fbActive"];
    } else {
        self.facebookImageView.image = [UIImage imageNamed:@"fbNonActive"];
    }
}

#pragma mark - QLProfileViewDelegate

- (void)logoutButtonWasPressed {
    [self.bankAuthService logoutCurrentUser:^(BOOL success, NSError *error) {
        if (success) {
            UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
            QLTabBarController *tabBarController = (QLTabBarController *)[mainWindow rootViewController];
            [tabBarController showLoginScreen:YES];
        }
    }];
}

- (void)addCardButtonWasPressed {
    [self performSegueWithIdentifier:QLProfileAddCardSegue
                              sender:self];
}

@end
