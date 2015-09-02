//
//  profilesViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/9.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "profilesViewController.h"

@interface profilesViewController ()

@end

@implementation profilesViewController

@synthesize myTableView;
@synthesize titleArray1,titleArray2,detailsArray,keysArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:24.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"个人信息";
    
    UIBarButtonItem *registerButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = registerButton;
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    //myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:myTableView];
    
    titleArray1 = [[NSArray alloc] initWithObjects:@"头像",@"名字",@"性别",@"生日",@"职业", nil];
    titleArray2 = [[NSArray alloc] initWithObjects:@"地址",@"电话",@"个性签名", nil];
    
    keysArray = [[NSArray alloc] initWithObjects:@"headIcon", @"nickName", @"sex", @"birthDay", @"profession", @"address", @"phone",@"signature", nil];
    
    detailsArray = [[NSMutableArray alloc] init];
    
    for (NSString *str in keysArray) {
        //NSLog(@"~~%@",[userConfiguration getStringValueForConfigurationKey:str]);
        [detailsArray addObject:[userConfiguration getStringValueForConfigurationKey:str]];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recModify:) name:@"passModify" object:nil];
    
    nameStr = [detailsArray objectAtIndex:1];
    sexStr = [detailsArray objectAtIndex:2];
    //ageStr = [detailsArray objectAtIndex:3];
    occupationStr = [detailsArray objectAtIndex:4];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //时间戳转换
    NSString * newString = [[detailsArray objectAtIndex:3] substringWithRange:NSMakeRange(0, [[detailsArray objectAtIndex:3] length] - 3)];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[newString integerValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    ageStr = confromTimespStr;
    
    addressStr = [detailsArray objectAtIndex:5];
    phoneStr = [detailsArray objectAtIndex:6];
    signatuStr = [detailsArray objectAtIndex:7];
    
    
}

- (void)save:(id)sender {
    [self updateProfiles];
}

- (void)recModify:(NSNotification *)notification
{
    NSDictionary *getDic = [notification userInfo];
    getType = [getDic objectForKey:@"type"];
    getValue = [getDic objectForKey:@"value"];
    
    self.navigationItem.rightBarButtonItem.enabled = YES;
    
    NSLog(@"type = %@, value = %@",getType,getValue);
    
    if ([getType isEqualToString:@"name"]) {
        
        nameStr = getValue;
        
        profilesTableViewCell *cell= (profilesTableViewCell *)[myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        cell.subTextLabel.text = getValue;
        
    } else if ([getType isEqualToString:@"sex"]) {
        
        sexStr = getValue;
        
        profilesTableViewCell *cell= (profilesTableViewCell *)[myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
        
        if ([getValue isEqualToString:@"0"]) {
            cell.subTextLabel.text = @"男";
        } else {
            cell.subTextLabel.text = @"女";
        }
        
    } else if ([getType isEqualToString:@"age"]) {
        
        ageStr = getValue;
        
        profilesTableViewCell *cell= (profilesTableViewCell *)[myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
        cell.subTextLabel.text = getValue;
        
    } else if ([getType isEqualToString:@"occupation"]) {
        
        occupationStr = getValue;
        
        profilesTableViewCell *cell= (profilesTableViewCell *)[myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
        cell.subTextLabel.text = getValue;
        
    } else if ([getType isEqualToString:@"address"]) {
        addressStr = getValue;
        
        profilesTableViewCell *cell= (profilesTableViewCell *)[myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
        cell.subTextLabel.text = getValue;
    } else if ([getType isEqualToString:@"signature"]) {
        signatuStr = getValue;
        
        profilesTableViewCell *cell= (profilesTableViewCell *)[myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:1]];
        cell.subTextLabel.text = getValue;
    } else if ([getType isEqualToString:@"phone"]) {
        phoneStr = getValue;
        
        profilesTableViewCell *cell= (profilesTableViewCell *)[myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
        cell.subTextLabel.text = getValue;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 5;
            break;
        case 1:
            return 3;
            break;
        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80.0f;
    }
    
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)indexPath.row];
    
    /*
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    */
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            if (cell == nil) {
                
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
            }
            
            cell.textLabel.text = [titleArray1 objectAtIndex:indexPath.row];
            
            UIImageView *portraitView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 100, 10, 60, 60)];
            portraitView.image = [UIImage imageNamed:@"portrait.png"];
            portraitView.layer.masksToBounds = YES;
            portraitView.layer.cornerRadius = portraitView.bounds.size.height / 2;
            [cell addSubview:portraitView];
            
            return cell;
            
        } else if (indexPath.row == 2) {
            
            profilesTableViewCell *cell = (profilesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"profilesTableViewCell" owner:self options:nil] lastObject];
            }
            
            /*
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 240, 10, 200, 30)];
            titleLabel.textColor = [UIColor lightGrayColor];
            titleLabel.textAlignment = NSTextAlignmentRight;
            */
            
            if ([[detailsArray objectAtIndex:indexPath.section * 5 + indexPath.row] isEqualToString:@"1"]) {
                cell.subTextLabel.text = @"女";
            } else {
                cell.subTextLabel.text = @"男";
            }
            
            cell.textLabel.text = [titleArray1 objectAtIndex:indexPath.row];
            
            return cell;
        } else {
            
            profilesTableViewCell *cell = (profilesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"profilesTableViewCell" owner:self options:nil] lastObject];
            }
            
            if (indexPath.row == 3) {
                cell.subTextLabel.text = ageStr;
            } else {
                cell.subTextLabel.text = [detailsArray objectAtIndex:indexPath.section * 5 + indexPath.row];
            }
            
            cell.textLabel.text = [titleArray1 objectAtIndex:indexPath.row];
            
            return cell;
        }
        
    } else if (indexPath.section == 1) {
        
        profilesTableViewCell *cell = (profilesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
        
        if (cell == nil) {
            
            cell.contentView.frame = cell.bounds;
            cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell = [[[NSBundle mainBundle] loadNibNamed:@"profilesTableViewCell" owner:self options:nil] lastObject];
        }
        
        cell.textLabel.text = [titleArray2 objectAtIndex:indexPath.row];
        cell.subTextLabel.text =[detailsArray objectAtIndex:indexPath.section * 5 + indexPath.row];
        
        return cell;
    }
    
    //cell.textLabel.text = @"Hello";
    
    //return cell;
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    if (indexPath.section == 0) {

        switch (row) {
            case 0:
            {
                UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                         delegate:self
                                                                cancelButtonTitle:@"取消"
                                                           destructiveButtonTitle:nil
                                                                otherButtonTitles:@"拍照",@"从手机相册选择", nil];
                actionSheet.delegate = self;
                [actionSheet showInView:self.view];
                break;
            }
            case 1:
            {
                modifyNameViewController *modifyNameVC = [[modifyNameViewController alloc] init];
                modifyNameVC.name = nameStr;
                [self.navigationController pushViewController:modifyNameVC animated:YES];
                break;
            }
            case 2:
            {
                
                modifySexViewController *modifySexVC = [[modifySexViewController alloc] init];
                modifySexVC.sex = sexStr;
                [self.navigationController pushViewController:modifySexVC animated:YES];
                
                break;
            }
            case 3:
            {
                
                modifyAgeViewController *modifyAgeVC = [[modifyAgeViewController alloc] init];
                modifyAgeVC.age = ageStr;
                [self.navigationController pushViewController:modifyAgeVC animated:YES];
                
                break;
            }
            case 4:
            {
                occupationViewController *occupationVC = [[occupationViewController alloc] init];
                occupationVC.occupation = occupationStr;
                [self.navigationController pushViewController:occupationVC animated:YES];
                
                break;
            }
            default:
                break;
        }
        
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
            {
                addressViewController *addressVC = [[addressViewController alloc] init];
                addressVC.address = addressStr;
                [self.navigationController pushViewController:addressVC animated:YES];
                break;
            }
            case 1:
            {
                telephoneViewController *telephoneVC = [[telephoneViewController alloc] init];
                telephoneVC.telephone = phoneStr;
                [self.navigationController pushViewController:telephoneVC animated:YES];
                break;
            }
            case 2:
            {
                signatureViewController *signatureVC = [[signatureViewController alloc] init];
                signatureVC.signature = signatuStr;
                [self.navigationController pushViewController:signatureVC animated:YES];
                break;
            }
            default:
                break;
        }
    }
}
#pragma mark ActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"拍照");
            // 拍照
            if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
                UIImagePickerController *controller = [[UIImagePickerController alloc] init];
                controller.sourceType = UIImagePickerControllerSourceTypeCamera;
                if ([self isFrontCameraAvailable]) {
                    controller.cameraDevice = UIImagePickerControllerCameraDeviceFront;
                }
                NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
                [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
                controller.mediaTypes = mediaTypes;
                controller.delegate = self;
                [self presentViewController:controller
                                   animated:YES
                                 completion:^(void){
                                     NSLog(@"Picker View Controller is presented");
                                 }];
            }
            break;
        case 1:
            NSLog(@"从手机相册选择");
            // 从相册中选取
            if ([self isPhotoLibraryAvailable]) {
                UIImagePickerController *controller = [[UIImagePickerController alloc] init];
                controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
                [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
                controller.mediaTypes = mediaTypes;
                controller.delegate = self;
                [self presentViewController:controller
                                   animated:YES
                                 completion:^(void){
                                     NSLog(@"Picker View Controller is presented");
                                 }];
            }
            break;
        default:
            break;
    }
}

// 修改ActionSheet按钮字体
- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    //ios 8的设定方案
    //[[UIView appearanceWhenContainedIn:[UIAlertController class], nil] setTintColor:[UIColor lightGrayColor]];
}

#pragma mark VPImageCropperDelegate
// callback when cropping finished
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    
}

// callback when cropping cancelled
- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^() {
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        portraitImg = [self imageByScalingToMaxSize:portraitImg];
        // 裁剪
        VPImageCropperViewController *imgEditorVC = [[VPImageCropperViewController alloc] initWithImage:portraitImg cropFrame:CGRectMake(0, 100.0f, self.view.frame.size.width, self.view.frame.size.width) limitScaleRatio:3.0];
        imgEditorVC.delegate = self;
        [self presentViewController:imgEditorVC animated:YES completion:^{
            // TO DO
        }];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    viewController.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航条375x64"] forBarMetrics:UIBarMetricsDefault];
    viewController.navigationController.navigationBar.translucent = NO;
    viewController.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:22.0f], NSFontAttributeName, nil];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

#pragma mark camera utility
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL) isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

- (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

#pragma mark image scale utility
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
    if (sourceImage.size.width < ORIGINAL_MAX_WIDTH) return sourceImage;
    CGFloat btWidth = 0.0f;
    CGFloat btHeight = 0.0f;
    if (sourceImage.size.width > sourceImage.size.height) {
        btHeight = ORIGINAL_MAX_WIDTH;
        btWidth = sourceImage.size.width * (ORIGINAL_MAX_WIDTH / sourceImage.size.height);
    } else {
        btWidth = ORIGINAL_MAX_WIDTH;
        btHeight = sourceImage.size.height * (ORIGINAL_MAX_WIDTH / sourceImage.size.width);
    }
    CGSize targetSize = CGSizeMake(btWidth, btHeight);
    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
}

- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark function
- (void)getUserProfiles:(NSString *)user
{
    //上传至服务器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"d6089681f79c7627bbac829307e041a7" forHTTPHeaderField:@"x-timebuy-sid"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //2.设置登录参数
    NSDictionary *dict = @{ @"phone":user};
    
    //3.请求
    [manager GET:@"http://192.168.8.102:8080/timebuy/user/info" parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"GET --> %@", responseObject); //自动返回主线程
        
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)updateProfiles
{
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.delegate = self;
    
    //上传至服务器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"d6089681f79c7627bbac829307e041a7" forHTTPHeaderField:@"x-timebuy-sid"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //2.设置登录参数

    NSDictionary *dict = @{ @"userId":[userConfiguration getStringValueForConfigurationKey:@"userId"],
                            @"headIcon":@"123",
                            @"nickName":nameStr,
                            @"sex":sexStr,
                            @"birthDay":ageStr,
                            @"profession":occupationStr,
                            @"address":addressStr,
                            @"phone":phoneStr,
                            @"signature":signatuStr};

    /*
    NSDictionary *dict = @{ @"userId":@"27",
                            @"headIcon":@"123",
                            @"nickName":@"oj",
                            @"sex":@"0",
                            @"birthDay":@"2011-10-2",
                            @"profession":@"123",
                            @"address":@"111",
                            @"phone":@"18767122229",
                            @"signature":@"hello"};
    */
    
    //3.请求
    [manager GET:@"http://192.168.8.102:8080/timebuy/user/update" parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"GET --> %@", responseObject); //自动返回主线程
        
        [HUD hide:YES];
        NSString *getStatus = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"success"]];
        NSString *getCode = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"code"]];
        if ([getStatus isEqualToString:@"1"] && [getCode isEqualToString:@"1000"]) {
            
            HUDinSuccess = [[MBProgressHUD alloc] initWithView:self.view];
            [self.view addSubview:HUDinSuccess];
            HUDinSuccess.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
            HUDinSuccess.mode = MBProgressHUDModeCustomView;
            HUDinSuccess.delegate = self;
            HUDinSuccess.labelText = @"修改成功";
            [HUDinSuccess show:YES];
            [HUDinSuccess hide:YES afterDelay:1];
            
        } else if ([getStatus isEqualToString:@"0"] && [getCode isEqualToString:@"2005"]) {
            [self showErrorWithTitle:@"修改失败" WithMessage:@"错误"];
        } else {
            [self showErrorWithTitle:@"修改失败" WithMessage:@"系统错误"];
        }
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        [HUD hide:YES];
        [self showErrorWithTitle:@"修改失败" WithMessage:@"网络连接失败，请检查网络设置"];
    }];
}

#pragma mark - MBProgressHUDDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [hud removeFromSuperview];
    
}

-(void)showErrorWithTitle:(NSString *)titile WithMessage:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:titile message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
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
