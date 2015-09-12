//
//  showDetailsViewController.m
//  TimeBuy
//
//  Created by yuweize on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "showDetailsViewController.h"
typedef NS_ENUM(NSInteger, FieldTag) {
    FieldTagHorizontalLayout = 1001,
    FieldTagVerticalLayout,
    FieldTagMaskType,
    FieldTagShowType,
    FieldTagDismissType,
    FieldTagBackgroundDismiss,
    FieldTagContentDismiss,
    FieldTagTimedDismiss,
};
@interface showDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UILabel *labelname;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollviewcontrol;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@end

@implementation showDetailsViewController
//tableview 动态添加数据
-(void)createTableviewData
{
    Sections = [[NSMutableArray alloc] initWithObjects:@"记录", nil];
    self.repeatData=[[NSMutableArray alloc]init];
    NSMutableDictionary *s1=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"小刚",@"name",@"高挺.png",@"picture",@"你好",@"neirong" ,@"一分钟前",@"time",nil];
    NSMutableDictionary *s2=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"余维泽",@"name",@"portrait.png",@"picture",@"你好",@"neirong",@"一分钟前",@"time",nil];
    self.repeatData=[[NSMutableArray alloc]initWithObjects:s1,s2, nil];
    NSLog(@"%@",self.repeatData);
    //[self.tableview reloadData];
    NSLog(@"数目%lu",(unsigned long)[self.repeatData count]);
    NSLog(@"suc");
}

- (void)viewDidLoad {
    [self createTableviewData];
    [super viewDidLoad];
    self.tableview.frame=CGRectMake(23, 23, 23, 23);
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.textfield.frame=CGRectMake(14, 585, 347, 45);
    //设置标题
    self.navigationItem.title=@"详情";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName, nil];
    self.labelname.text=@"余维泽";
    //设置圆形头像
    self.head.layer.masksToBounds=true;
    self.head.layer.cornerRadius=20;
    //设置滚动
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.scrollviewcontrol.contentSize=CGSizeMake(375,800);
    NSLog(@"suc3");
    //textlabel行距设置
    self.textLabel.numberOfLines=2;
    //设置行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 5;
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:13],
                                  NSParagraphStyleAttributeName:paragraphStyle};
    self.textLabel.attributedText = [[NSAttributedString alloc]initWithString:self.textLabel.text attributes:attributes];
    // Do any additional setup after loading the view from its nib.
}
-(void)keyboardDidChange{
    NSString *newString = [NSString stringWithFormat:@"%lu%@",(unsigned long)textview.text.length,@"/20"];
    
    //NSLog(@"%lu",(unsigned long)textview.text.length);
    label.text=newString;
}
-(void)keyboardDidHidden{
    NSLog(@"结束");
    self.textfield.text=textview.text;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        [popup dismiss:true];
        return NO;
    }
    return YES;
}
//弹出框设置
- (IBAction)pressdown:(id)sender {
    NSLog(@"输入框");
    // Generate content view to present
    UIView *contentView = [[UIView alloc] init];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 12.0;
    contentView.frame=CGRectMake(45, 208, 285, 179);
    textview=[[UITextView alloc]init];
    textview.frame=CGRectMake(0, 0, 285, 179);
    textview.text=@"想对Ta说点什么";
    textview.font=[UIFont fontWithName:@"Arial" size:18];
    [textview setTextColor:[UIColor lightGrayColor]];
    textview.keyboardType=UIKeyboardTypeDefault;
    textview.layer.cornerRadius=12.0;
    textview.delegate=self;
    textview.editable=true;
    [textview becomeFirstResponder];
    [[NSNotificationCenter
      defaultCenter] addObserver:self selector:@selector(keyboardDidChange)name:UITextViewTextDidChangeNotification object:textview];
    [[NSNotificationCenter
      defaultCenter] addObserver:self selector:@selector(keyboardDidHidden)name:UITextViewTextDidEndEditingNotification object:textview];
    label=[[UILabel alloc]initWithFrame:CGRectMake(233, 140, 50, 19)];
    label.text=@"8/20";
    label.font=[UIFont fontWithName:@"Arial" size:18];
    [label setTextColor:[UIColor lightGrayColor]];
    [contentView addSubview:textview];
    [contentView addSubview:label];
    popup = [KLCPopup popupWithContentView:contentView showType:KLCPopupShowTypeSlideInFromTop dismissType:KLCPopupDismissTypeSlideOutToBottom maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
    [popup show];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.repeatData count];
}
// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [Sections count];
}

//设置tableviewcell的样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if(tableView==self.tableview && [self.repeatData objectAtIndex:indexPath.row]!=nil)
    {
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        // Configure the cell.
        cell.backgroundColor=[UIColor whiteColor];
        [cell setAccessoryType:UITableViewCellAccessoryNone]; 
        //添加名字
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 10, 300, 19)];
        label1.textColor=[UIColor blackColor];
        label1.font=[UIFont fontWithName:@"Arial" size:18];
        [label1 setText:[[self.repeatData objectAtIndex:indexPath.row]objectForKey:@"name"]];
        [cell.contentView addSubview:label1];
        //添加回复
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 40, 300, 19)];
        label2.textColor=[UIColor blackColor];
        label2.font=[UIFont fontWithName:@"Arial" size:18];
        [label2 setText:[[self.repeatData objectAtIndex:indexPath.row]objectForKey:@"neirong"]];
        [cell.contentView addSubview:label2];
        //添加日期label
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake( 314, 10, 60, 13)];
        label3.textColor=[UIColor lightGrayColor];
        //label3.text =@"1分钟前";
        label3.font=[UIFont fontWithName:@"Arial" size:13];
        [label3 setText:[[self.repeatData objectAtIndex:indexPath.row]objectForKey:@"time"]];
        [cell.contentView addSubview:label3];
        //添加image
        //[[cell textLabel] setText:[[repeatData objectAtIndex: indexPath.row] objectForKey:@"name"]];
        UIImageView *image=[[UIImageView alloc]init];
        image.frame=CGRectMake(14, 10, 39, 39);
        image.layer.masksToBounds=true;
        image.layer.cornerRadius=20;
        [image setImage:[UIImage imageNamed:[[self.repeatData objectAtIndex:indexPath.row]objectForKey:@"picture"]]];
        [cell.contentView addSubview:image];
        return cell;
    }
    return NULL;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete)
 {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert)
 {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
